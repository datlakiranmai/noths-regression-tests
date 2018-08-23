# And(/^I enter in my details in sign up form$/) do
#   @app.registration.enter_user_details
# end
#
# And(/^I click (.*) button$/) do |button_name|
#   puts "User email address is #{@app.registration.email_address}"
#   @app.registration.click_on_button(button_name)
# end
#
# Then(/^I should register successfully$/) do
#   name="#{@app.registration.first_name} #{@app.registration.last_name}"
#   expect(@app.home.signed_in_user.text.downcase).to have_text(name)
# end
#
# When(/^I go for (.*) from wishlist page$/) do |button_name|
#   @app.wishlist.click_on(button_name)
# end
#
# And(/^I enter in my details in your details form$/) do
#   @app.registration.enter_your_details_in_checkout
# end
#
# And(/^I enter in my address details$/) do
#   @app.registration.enter_address_details
# end
#
# And(/^I Continue to next page$/) do
#   @app.registration.click_on_button('Continue')
# end
#
#
# And(/^I enter in existing details in your details form$/) do
#   @app.registration.enter_existing_user_details
# end
#
# Then(/^I should see error message saying (.*)$/) do |error_message|
#   expect(@app.registration.error_message.text.downcase).to eq(error_message.downcase)
# end
#
# And(/^I should see info message saying (.*)$/) do |info_message|
#   expect(@app.registration.info_message.text.downcase).to eq(info_message.downcase)
# end
#
#
# And(/^I should see password text field input should get cleared up$/) do
#   expect(@app.registration.password_field.value).to eq('')
#   expect(@app.registration.password_confirm_field.value).to eq('')
#   sleep 3
# end
#
# Then(/^I should see error title saying (.*)$/) do |error_title|
#   expect(@app.registration.error_title.text.downcase).to eq(error_title.downcase)
# end
#
# And(/^I register as a new Cognito user$/) do
#   steps %Q{
#     Given I am on Home page
#     When I click on Register
#     And I enter in my email in small cases in sign up form
#     And I click Submit button
#     And I navigate to My accounts page
#     And I choose my details from my account section
#     And I should be taken to My details page
#     Then I should see my email address in my accounts page
#         }
# end
#
#
# And(/^I enter in my email in small cases in sign up form$/) do
#   @app.registration.enter_email_address_small_cases
# end
#
# And(/^I select my country code as (.*)$/) do |country_code|
#   @app.registration.change_country_code(country_code)
# end
#
# And(/^I provide my contact number as (.*)$/) do |contact_number|
#   @app.registration.set_contact_number(contact_number)
# end


And(/^I enter in my details in sign up form$/) do
  @app.registration.enter_user_details
end

And(/^I click (.*) button$/) do |button_name|
  puts "User email address is #{@app.registration.email_address}"
  @app.registration.click_on_button(button_name)
end

Then(/^I should register successfully$/) do
  name = "#{@app.registration.first_name} #{@app.registration.last_name}"
  expect(@app.home.signed_in_user.text.downcase).to have_text(name)
end

When(/^I go for (.*) from wishlist page$/) do |button_name|
  @app.wishlist.click_on(button_name)
end

And(/^I enter in my details in your details form$/) do
  save_screenshot("checkout_registration.png")
  @app.registration.enter_user_details
end

And(/^I enter in my address details$/) do
  save_screenshot("details.png")
  @app.registration.enter_address_details
end

And(/^I Continue to next page$/) do
  @app.registration.click_on_button('Submit')
end

And(/^I enter my details in the legacy register form$/) do
  @app.registration.register_legacy_user
end


And(/^I choose to (.*) for (.*) communication$/) do |status, type|
  @app.registration.communication_checkbox(status, type)
end

And(/^I should see the (.*) checkbox is (.*)$/) do |checkbox_name, status|
  sleep 4
  if status == "checked"
    expect(@app.registration.verify_checkbox_status(checkbox_name)).to eq(true), "[FAILED] - #{checkbox_name} checkbox is NOT #{status}"
  else
    expect(@app.registration.verify_checkbox_status(checkbox_name)).to eq(false), "[FAILED] - #{checkbox_name} checkbox is NOT #{status}"
  end
end


And(/^I register again as a new user$/) do
  @app.registration.register_again
end


And(/^I check the privacy policy$/) do
  @app.registration.check_privacy_policy_checkbox
end


And(/^I enter in existing details in your details form$/) do
  @app.registration.enter_existing_user_details
end

Then(/^I should see error message saying (.*)$/) do |error_message|
  @app.registration.user_already_exists_msg
  expect(@app.registration.error_message.text.downcase).to eq(error_message.downcase)
end

And(/^I should see info message saying (.*)$/) do |info_message|
  expect(@app.registration.info_message.text.downcase).to eq(info_message.downcase)
end


Then(/^I should see following inline validation error messages$/) do |table|
  expect(table.raw.flatten <=> @app.registration.inline_validation_text).to eq(0),"[FAILED] - Less/More Inline validations are displayed than the expected validation messages!"
end

And(/^I should see password text field input should get cleared up$/) do
  expect(@app.registration.password_field.value).to eq('')
  expect(@app.registration.password_confirm_field.value).to eq('')
  sleep 3
end

Then(/^I should see error title saying (.*)$/) do |error_title|
  expect(@app.registration.error_message.text.downcase).to eq(error_title.downcase)
end

And(/^I register as a new Cognito user$/) do
  steps %Q{
    Given I am on Home page
    When I click on Register
    And I enter in my email in small cases in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page
        }
end

Then(/^I should see privacy policy error message saying (.*)$/) do |error_message|
  expect(@app.registration.privacy_policy_msg.downcase).to eq(error_message.downcase)
end

And(/^I enter in my email in small cases in sign up form$/) do
  @app.registration.enter_email_address_small_cases
end

And(/^I select my country code as (.*)$/) do |country_code|
  @app.registration.change_country_code(country_code)
end

And(/^I provide my contact number as (.*)$/) do |contact_number|
  @app.registration.set_contact_number(contact_number)
end

And(/^I enter two emails that don't match$/) do
  @app.registration.enter_mismatched_email
  sleep 10
end

And(/^I should see password info message saying (.*)$/) do |msg|
  expect(@app.registration.secure_password_msg.downcase).to eq(msg.downcase)
end

And(/^I enter a password that is too short$/) do
  @app.registration.enter_short_password
  sleep 10
end

And(/^I enter two passwords that don't match$/) do
  @app.registration.enter_mismatched_password
  sleep 10
end