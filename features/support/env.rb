require 'selenium-webdriver'
require 'sauce_whisk'
require 'capybara'
require 'Capybara/Cucumber'
require 'rspec/expectations'
require 'pry'
require 'phantomjs'
require 'capybara/poltergeist'

ENV['ENV_ID'] ||= 'dev'

APP_HOST="http://www.public.#{ENV['ENV_ID']}.qa.noths.com"

Before do
  Capybara.configure do |config|
    Capybara.app_host = APP_HOST
    config.run_server = false
    config.default_driver = (ENV['DRIVER'] || 'chrome').to_sym
    config.default_max_wait_time = 10
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
    $driver=Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
end

After do
  # entries = $driver.manage.logs.get(:browser)
  # puts "log entries are #{entries}"
  CognitoIdentityProviderPool.delete_identity($email_address)
  $driver.quit if ENV['DRIVER'].nil?
end

After('@legacy') do
  CognitoUserTable.delete_user(6)
end




