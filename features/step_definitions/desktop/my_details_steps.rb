And(/^I navigate to My accounts page$/) do
  @app.home.navigate_to_myaccounts
end

And(/^I should be taken to (.*) page$/) do |pagename|
  #@mydetails_page.check_page_name(pagename)
  sleep 15
  expect(@app.my_details.my_details_page.text.eql?(pagename.upcase)).to eq(true)
end

And(/^I choose (.*) from my account section$/) do |option|
  @app.my_details.click_on(option)
end

And(/^I choose (.*) from my details section$/) do |option|
  @app.my_details.click_on_link(option)
end

And(/^I should see my email address in my accounts page$/) do
  puts @app.my_details.my_details_address.value
  expect(@app.my_details.my_details_address.value).to have_text(@app.registration.email_address)
end


And(/^I should see my new email address in my accounts page$/) do
  puts @app.my_details.my_details_address.value
  expect(@app.my_details.my_details_address.value).to have_text(@app.my_details.new_email_address)
end

And(/^I should see my country code as (.*)$/) do |country_code|
  expect(@app.my_details.selected_country_code).to eq(country_code.downcase)
end

And(/^I should see my contact number as (.*)$/) do |contact_number|
  if contact_number.eql?('empty')
    expect(@app.my_details.my_details_contact_number.value).to be_empty
  else
    expect(@app.my_details.my_details_contact_number.value).to eq(contact_number.strip)
  end
end

Then(/^I should see flash message saying (.*)$/) do |message|
  expect(@app.my_details.details_updated.text.downcase).to eq(message.downcase)
end

And(/^I change my existing password in my details page$/) do
  @app.my_details.change_password(@app.registration.password)
end

And(/^I provide (.*) current password$/) do |password_status|
  if password_status.eql? 'valid'
    @app.my_details.change_only_current_password(@app.registration.password)
  else
    @invalid_current_password='Invalidpassword'
    @app.my_details.change_only_current_password(@invalid_current_password)
  end
end

And(/^I submit my details form$/) do
  @app.my_details.click_submit
end

And(/^I provide a new password as (.*)$/) do |password|
  @app.my_details.enter_new_password(password)
end

Then(/^I should get password length validation error saying (.*)$/) do |error_message|
  expect(@app.my_details.value_too_short_validation_msg.text.downcase).to eq(error_message.downcase)
end


Then(/^I should get password mismatch validation error saying (.*)$/) do |error_message|
  expect(@app.my_details.value_mismatch_validation_msg.text.downcase).to eq(error_message.downcase)
end

Then(/^I should get password error messages title saying (.*)$/) do |error_message_title|
  expect(@app.my_details.error_message_title.text.downcase).to eq(error_message_title.downcase)
end

And(/^I should get password error message saying (.*)$/) do |error_message|
  expect(@app.my_details.error_message.text.downcase).to eq(error_message.downcase)
end

And(/^I provide a confirm password as (.*)$/) do |password|
  @app.my_details.enter_confirm_password(password)
end

And(/^I change my email address in my details page$/) do
  @app.my_details.change_email_address
end