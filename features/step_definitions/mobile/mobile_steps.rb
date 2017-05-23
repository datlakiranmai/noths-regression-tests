When(/^I navigate to (.*)$/) do |button_name|
  @app.mobile.click_on(button_name)
end

And(/^I click link to go to (.*)$/) do |link_name|
  @app.mobile.click_on_link(link_name)
end

And(/^I choose to (.*)$/) do |button_name|
  @app.mobile.click_on(button_name)
end

Then(/^I should see (.*) and (.*) buttons$/) do |signin_btn,register_btn|
  expect(@app.home.mobile_buttons.first.text).to eq(signin_btn.upcase)
  expect(@app.home.mobile_buttons.last.text).to eq(register_btn.upcase)
end