And(/^I enter my login credentials:$/) do |table|
  # table is a table.hashes.keys # => [:username, :password]
  table.raw.each do |key, value|
    if key == 'user_name' then
      $email_address = value
    else
      @password = value
    end
  end
  @app.login.signin_credentials($email_address, @password)
end

Then(/^I should login successfully as (.*)$/) do |user_name|
  expect(@app.home.signed_in_user).to have_text(user_name)
end


And(/^I sign in with my new credentials$/) do
  @app.login.signin_credentials($email_address, @app.registration.password)
end

Then(/^I should login successfully$/) do
  name="#{@app.registration.first_name} #{@app.registration.last_name}"
  expect(@app.home.signed_in_user.text.downcase).to have_text(name)
end

And(/^I sign in with invalid password$/) do
  @app.login.signin_credentials($email_address, "inval23")
end

Then(/^I should see error message (.*)$/) do |error_msg|
  expect(@app.login.sign_in_error_msg.text).to eq(error_msg)
end

And(/^I should see sign in password textfield input should get cleared up$/) do
  expect(@app.login.login_pwd.text).to eq('')
end

Then(/^I should see sign in failure with message (.*)$/) do |error_msg|
  expect(@app.login.checkout_sign_in_error_msg.text).to eq(error_msg)
end