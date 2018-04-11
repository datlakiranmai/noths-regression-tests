require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'phantomjs'
require 'capybara/poltergeist'
require 'allure-cucumber'
require_relative('configuration')


ENV['ENV_ID'] ||= 'dev'

configuration = Configuration.instance

APP_HOST = "http://www.public.#{configuration.env_id}.qa.noths.com"

include AllureCucumber::DSL

AllureCucumber.configure do |c|
  c.output_dir = "output/dir"
  c.issue_prefix = '@JIRA++'
end

Before do
  Capybara.configure do |config|
    Capybara.app_host = APP_HOST
    config.run_server = false
    config.default_driver = (ENV['DRIVER'] || 'chrome').to_sym
    config.default_max_wait_time = 60
    config.match = :prefer_exact
    config.javascript_driver = :webkit_debug
  end

  Capybara.register_driver :headless do |app|
    options = {
      js_errors: false,
      timeout: 120,
      debug: false,
      phantomjs_options: ['--load-images=no', '--disk-cache=false'],
      inspector: true,
      window_size: [3000, 3000]
    }
    $driver = Capybara::Poltergeist::Driver.new(app, options)
  end


  # Downgrade selenium to 2.53.0 inorder to use firefox profile. The lastest firefox version supported by selenium is 46.0.
  Capybara.register_driver :firefox do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    $driver = Capybara::Selenium::Driver.new(app, browser: :firefox, :http_client => client)

  end

  chrome_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome

  #  Capybara.register_driver :chrome do |app|
  #    client = Selenium::WebDriver::Remote::Http::Default.new
  #    client.read_timeout = 180
  #    $driver = Capybara::Selenium::Driver.new(app,
  #                                             browser: :remote,
  #                                             url: 'http://172.17.0.2:4444/wd/hub',
  #                                             http_client: client,
  #                                             desired_capabilities: chrome_capabilities)
  #
  # end

  Capybara.register_driver :chrome do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
     client.read_timeout = 180
    $driver=Capybara::Selenium::Driver.new(app, browser: :chrome, :http_client => client, desired_capabilities: {
      "chromeOptions" => {
        "args" => %w{ no-sandbox start-fullscreen disable-impl-side-painting }
      }
    })
  end

  Capybara.register_driver :mobile do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 180
    $driver = Capybara::Selenium::Driver.new(app, browser: :chrome, :http_client => client)
  end
  if Capybara.current_driver == :mobile
    page.driver.browser.manage.window.resize_to(375, 667)
  end
  @app ||= Noths::PageObjects::Application.new
end


After do |scenario|
  if scenario.failed?
    path = save_screenshot("output/dir/#{scenario.name}.png")
    p 'attaching screenshot on failure'
    AllureCucumber::DSL.attach_file("[FAILED]-#{scenario.name}", File.open(File.expand_path(path)))
  end
  #CognitoIdentityProviderPool.delete_identity($email_address) if !$email_address.nil?
  $driver.quit if ENV['DRIVER'].nil?
end
