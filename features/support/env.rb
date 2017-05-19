require 'selenium-webdriver'
require 'capybara'
require 'Capybara/Cucumber'
require 'rspec/expectations'
require 'phantomjs'
require 'capybara/poltergeist'

ENV['ENV_ID'] ||= 'dev'

APP_HOST="http://www.public.#{ENV['ENV_ID']}.qa.noths.com"

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
    $driver=Capybara::Poltergeist::Driver.new(app, options)
  end

  Capybara.register_driver :chrome do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
    $driver=Capybara::Selenium::Driver.new(app, browser: :chrome, :http_client => client)
  end

  Capybara.register_driver :mobile do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
    $driver=Capybara::Selenium::Driver.new(app, browser: :chrome, :http_client => client)
  end
  page.driver.browser.manage.window.resize_to(375, 667) if Capybara.current_driver == :mobile
  @app ||= Noths::PageObjects::Application.new
end


After do
  #CognitoIdentityProviderPool.delete_identity($email_address) if !$email_address.nil?
  $driver.quit if ENV['DRIVER'].nil?
end


