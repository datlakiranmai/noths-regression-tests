require 'selenium-webdriver'
require 'sauce_whisk'
require 'capybara'
require 'Capybara/Cucumber'
require 'rspec/expectations'
require 'pry'

APP_HOST="http://www.public.#{ENV['ENV_ID']}.qa.noths.com"


Before do
  Capybara.app_host = APP_HOST
  Capybara.default_driver = :selenium
  Capybara.default_max_wait_time = 20
  Capybara.register_driver :selenium do |app|
    $driver=Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end

After do
  $driver.quit
end


