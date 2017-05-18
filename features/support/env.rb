require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
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
    config.default_max_wait_time = 20
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
      window_size: [3000,3000]
    }
    $driver=Capybara::Poltergeist::Driver.new(app, options)
  end

  Capybara.register_driver :chrome do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
    $driver=Capybara::Selenium::Driver.new(app, browser: :chrome, :http_client => client, desired_capabilities: {
      "chromeOptions" => {
       "args" => %w{ no-sandbox start-fullscreen disable-impl-side-painting }
     }
    })
  end

end


After do
  #CognitoIdentityProviderPool.delete_identity($email_address) if !$email_address.nil?
  $driver.quit if ENV['DRIVER'].nil?
end


