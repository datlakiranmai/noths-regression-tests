Then(/^I should successfully sign out$/) do
  expect(@app.home.signin_button).to have_text("sign in")
  expect(@app.home.register_button).to have_text("register")
  expect(@app.home.page_title).to have_text("SIGN IN")
end


And(/^I should see the message (.*)$/) do |message|
  expect(@app.home.info).to have_text(message)
end