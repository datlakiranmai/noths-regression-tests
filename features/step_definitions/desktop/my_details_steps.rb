And(/^I navigate to My accounts page$/) do
  @app.home.navigate_to_myaccounts
end

And(/^I should be taken to (.*) page$/) do |pagename|
  #@mydetails_page.check_page_name(pagename)
  expect(@app.my_details.my_details_page.text.eql?(pagename.upcase))
end

And(/^I choose (.*) from my account section$/) do |option|
  @app.my_details.click_on(option)
end

And(/^I choose (.*) from my details section$/) do |option|
  @app.my_details.click_on_link(option)
end

And(/^I should see the my email address in my accounts page$/) do
  puts @app.my_details.my_details_address.value
  expect(@app.my_details.my_details_address.value).to have_text(@app.registration.email_address)
end

Then(/^I should see flash message saying (.*)$/) do |flash_message|
  expect(@app.my_details.details_updated.text.downcase).to eq(flash_message.downcase)
end

And(/^I change my existing password in my details page$/) do
  @app.my_details.change_password(@app.registration.password)
end