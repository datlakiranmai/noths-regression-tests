Then(/^I should login successfully as (.*)$/) do |user_name|
  expect(@app.home.signed_in_user).to have_text(user_name)
end


And(/^I sign in with my new credentials$/) do
  puts "registration email address is #{@app.registration.email_address}"
  @app.login.signin_credentials(@app.registration.email_address, @app.registration.password)
end

And(/^I sign in with my existing credentials$/) do
  @app.login.signin_credentials(@app.registration.email_address, @app.registration.password)
end

Then(/^I should login successfully$/) do
  name="#{@app.registration.first_name} #{@app.registration.last_name}"
  expect(@app.home.signed_in_user.text.downcase).to have_text(name)
end

And(/^I sign in with invalid (.*)$/) do |text|
  if text.eql? "password"
    @app.login.signin_credentials(@app.registration.email_address, "inval23")
  else
    @app.login.signin_credentials("invalidemail@test.com", "inval23")
  end
end

Then(/^I should see error message (.*)$/) do |error_msg|
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
  @app.login.signin_credentials(@app.registration.email_address.upcase, @app.registration.password)
end

And(/^I sign in with my new password$/) do
  puts "new password #{@app.my_details.new_password}"
  @app.login.signin_credentials(@app.registration.email_address, @app.my_details.new_password)
end

And(/^I sign in with new current password$/) do
  @app.login.signin_credentials(@app.registration.email_address, @invalid_current_password)
end

And(/^I sign in with my new password as (.*)$/) do |password|
  @app.login.signin_credentials(@app.registration.email_address, password)
end