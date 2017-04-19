And(/^I enter my login credentials:$/) do |table|
  @signin_page = LoginPage.new
  # table is a table.hashes.keys # => [:username, :password]
  table.raw.each do |key, value|
    if key == 'user_name' then
      @username = value
    else
      @password = value
    end
  end
  @signin_page.signin_credentials(@username, @password)
end

Then(/^I should login successfully as (.*)$/) do |user_name|
  expect(@home_page.signed_in_user).to have_text(user_name)
end


And(/^I sign in with my new credentials$/) do
  @signin_page = LoginPage.new
  @signin_page.signin_credentials(@signup_page.email_address, @signup_page.password)
end

Then(/^I should login successfully$/) do
  name="#{@signup_page.first_name} #{@signup_page.last_name}"
  expect(@home_page.signed_in_user.text.downcase).to have_text(name)
end