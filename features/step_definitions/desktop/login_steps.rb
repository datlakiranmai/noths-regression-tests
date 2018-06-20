# Then(/^I should login successfully as (.*)$/) do |user_name|
#   expect(@app.home.signed_in_user).to have_text(user_name)
# end
#
#
# And(/^I sign in with my new credentials$/) do
#   puts "registration email address is #{@app.registration.email_address}"
#   puts "password is #{@app.registration.password}"
#   @app.login.signin_credentials(@app.registration.email_address, @app.registration.password)
# end
#
# And(/^I sign in with my existing credentials$/) do
#   @app.login.signin_credentials(@app.registration.email_address, @app.registration.password)
# end
#
# Then(/^I should login successfully$/) do
#   name="#{@app.registration.first_name} #{@app.registration.last_name}"
#   expect(@app.home.signed_in_user.text.downcase).to have_text(name)
# end
#
# And(/^I sign in with invalid (.*)$/) do |text|
#   if text.eql? "password"
#     @app.login.signin_credentials(@app.registration.email_address, "inval23")
#   else
#     @app.login.signin_credentials("invalidemail@test.com", "inva")
#   end
# end
#
# Then(/^I should see error message (.*)$/) do |error_msg|
#   expect(@app.login.sign_in_error_msg.text).to eq(error_msg)
# end
#
# And(/^I should see sign in password textfield input should get cleared up$/) do
#   expect(@app.login.login_pwd.value).to eq('')
#   sleep 3
# end
#
# Then(/^I should see sign in failure with message (.*)$/) do |error_msg|
#   expect(@app.login.checkout_sign_in_error_msg.text).to eq(error_msg)
# end
#
# And(/^I sign in with my user name in capital letters$/) do
#   puts "registration email address in caps #{@app.registration.email_address.upcase}"
#   puts "password is #{@app.registration.password}"
#   @app.login.signin_credentials(@app.registration.email_address.upcase, @app.registration.password)
# end
#
# And(/^I sign in with my new password$/) do
#   puts "new password #{@app.my_details.new_password}"
#   @app.login.signin_credentials(@app.registration.email_address, @app.my_details.new_password)
# end
#
# And(/^I sign in with new current password$/) do
#   @app.login.signin_credentials(@app.registration.email_address, @invalid_current_password)
# end
#
# And(/^I sign in with my new password as (.*)$/) do |password|
#   @app.login.signin_credentials(@app.registration.email_address, password)
# end
#
#
# And(/^I sign in with my new email address$/) do
#   puts "email address is #{@app.my_details.new_email_address}"
#   puts "password is #{@app.registration.password}"
#   @app.login.signin_credentials(@app.my_details.new_email_address, @app.registration.password)
# end
Then(/^I should login successfully as (.*)$/) do |user_name|
  expect(@app.home.signed_in_user).to have_text(user_name)
end


And(/^I sign in with my new credentials$/) do
  puts "registration email address is #{@app.registration.email_address}"
  puts "password is #{@app.registration.password}"
  save_screenshot("login_page.png")
  @app.login.signin(@app.registration.email_address, @app.registration.password)
  #expect(@app.login.handle_marketing_popup?).to eq(true),"[Failed] - Marketing Prefrences pop up is not displayed!"
  #@app.login.handle_marketing_popup
end

And(/^I sign in with my existing credentials$/) do
  @app.login.signin_credentials(@app.registration.email_address, @app.registration.password)
end


And(/^I sign in for the first time with my new credentials$/) do
  @app.login.signin(@app.registration.email_address, @app.registration.password)
  #expect(@app.login.handle_marketing_popup?).to eq(true),"[Failed] - Marketing Prefrences pop up is not displayed!"
  @app.login.handle_marketing_popup
end


And(/^I sign in for the first time with my user name in capital letters$/) do
  @app.login.signin(@app.registration.email_address.upcase, @app.registration.password)
  #expect(@app.login.handle_marketing_popup?).to eq(true),"[Failed] - Marketing Prefrences pop up is not displayed!"
  @app.login.handle_marketing_popup
end

Then(/^I should login successfully$/) do
  name="#{@app.registration.first_name} #{@app.registration.last_name}"
  expect(@app.home.signed_in_user.text.downcase).to have_text(name)
end

And(/^I sign in with invalid (.*)$/) do |text|
  if text.eql? "password"
    @app.login.signin(@app.registration.email_address, "inval23456789")
  else
    @app.login.signin("invalidemail@test.com", "invalidpassword")
  end
end

Then(/^I should see error message (.*)$/) do |error_msg|
  sleep 2
  expect(@app.login.sign_in_error_msg.text).to eq(error_msg)
end

And(/^I should see sign in password textfield input should get cleared up$/) do
  expect(@app.login.login_pwd.value).to eq('')
  sleep 3
end

Then(/^I should see sign in failure with message (.*)$/) do |error_msg|
  expect(@app.login.checkout_sign_in_error_msg.text).to eq(error_msg)
end

And(/^I sign in with my user name in capital letters$/) do
  puts "email address is #{@app.registration.email_address.upcase}"
  puts "password is #{@app.registration.password}"
  @app.login.signin_caps(@app.registration.email_address.upcase, @app.registration.password)
  puts @app.login.check_email_address_case
  expect(@app.login.check_email_address_case).to eq(@app.registration.email_address.upcase),"[Failed] - Email address is NOT in uppercase"
  @app.login.click_signin
  #expect(@app.login.handle_marketing_popup?).to eq(true),"[Failed] - Marketing Prefrences pop up is not displayed!"
  #@app.login.handle_marketing_popup
end

And(/^I sign in with my new password$/) do
  puts "new password #{@app.my_details.new_password}"
  @app.login.signin(@app.registration.email_address, @app.my_details.new_password)
end

And(/^I sign in with new current password$/) do
  @app.login.signin_credentials(@app.registration.email_address, @invalid_current_password)
end

And(/^I sign in with my new password as (.*)$/) do |password|
  @app.login.signin_credentials(@app.registration.email_address, password)
end

And(/^I sign in with my new email address$/) do
  puts "email address is #{@app.my_details.new_email_address}"
  puts "password is #{@app.registration.password}"
  @app.login.signin_credentials(@app.my_details.new_email_address, @app.registration.password)
end

And(/^I enter a valid email and password$/) do
  @app.login.signin(@user_name,@password)
end

And(/^I enter a valid email in capitals and password$/) do
  @app.login.signin(@user_name.upcase,@password)
end

And(/^I enter a valid email but incorrect password$/) do
  @app.login.signin(@user_name,'invalid')
end

And(/^I enter a non existent email and password$/) do
  @app.login.signin('invalid_emailaddress@gmail.com','password')
end

Then(/^I should get the error messages saying (.*)$/) do |error_message|
  expect(@app.login.sign_in_error_msg.text.downcase).to eq(error_message.downcase)
end