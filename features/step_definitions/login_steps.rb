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
  @app.login.signin_credentials($email_address, @signup_page.password)
end

Then(/^I should login successfully$/) do
  name="#{@app.login.first_name} #{@app.login.last_name}"
  expect(@app.login.signed_in_user.text.downcase).to have_text(name)
end