Then(/^I should successfully sign out$/) do
  expect(@home_page.signin_button).to have_text("sign in")
  expect(@home_page.register_button).to have_text("register")
  expect(@home_page.page_title).to have_text("SIGN IN")
end


And(/^I should see the message (.*)$/) do |message|
  expect(@home_page.info).to have_text(message)
end