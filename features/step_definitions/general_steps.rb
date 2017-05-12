And(/^I navigate to a product detail page (.*)$/) do |navigationlink|
  @app.home.navigate(navigationlink)
end

Given /^I am on Home page$/ do
  @app.home.navigate
  if headless?
    page.driver.network_traffic do |request|
      request.response_parts.uniq(&:url).each do |response|
        puts "\n Responce URL #{response.url}: \n Status"
      end
    end
  end
end

When(/^I click on (.*)$/) do |button_name|
  @app.home.click_on(button_name)
end


Given(/^I register as a new user$/) do
  steps %Q{
    Given I am on Home page
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button

        }
end

#Then I should register successfully
Given(/^I sign in as QA Automation$/) do
  steps %Q{
     Given I am on Home page
     When I click on Signin
     And I enter my login credentials:
      | user_name | qaautomation01@gmail.com |
      | password  | Newlife2017                    |
     Then I should login successfully as Qa Automation
     And I should be taken to My details page
     }
end


When(/^I tap on the link (.*) in footer$/) do |link_name|
  @app.home.click_on_link(link_name)
end


And(/^I sign out from my account$/) do
  steps %Q{
  When I navigate to My accounts page
    And I choose sign out from my account section
    Then I should successfully sign out
    And I should see the message You have been signed out
   }
end


When(/^I hover my account via header$/) do
  @app.home.hover_myaccounts
end

# And(/^I navigate to home page$/) do
#   @home_page = HomePage.new
#   @home_page.navigate
# end


And(/^I should be redirected to home page$/) do
  expect(@app.home.home_page?).to eq(true)
  expect(@app.home.get_desktop_banners_count).to be > (1)
end