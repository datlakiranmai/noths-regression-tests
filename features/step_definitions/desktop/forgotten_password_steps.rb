And(/^I provide my (.*) email address$/) do |email_address|
  if email_address.eql? "valid"
    @app.forgotten_password.enter_email_address("sadha877117@gmail.com")
  elsif email_address.eql? "invalid"
    @app.forgotten_password.enter_email_address(" ")
  elsif email_address.eql? "noths"
    @app.forgotten_password.enter_email_address("noths@notonthehighstreet.com")
  end
end


Then(/^I should see (.*)$/) do |error_message|
  expect(@app.login.forgotten_password_info_msg.text).to eq(error_message)
end

Then(/^I should see security error message saying (.*)$/) do |error_message|
  expect(@app.login.noths_employee_security_error_message.text).to eq(error_message)
end


Then(/^I should see email validation error as (.*)$/) do |error_message|
  expect(@app.forgotten_password.inline_validation_error_msg.text).to eq(error_message)
end


And(/^I submit my forgotten password form$/) do
  @app.forgotten_password.click_button
end