Then(/^I enter my paypal login credentials$/) do
  @app.paypal_page.wait_for_paypal_page
  expect(@app.paypal_page.paypal_signin_page?).to eq(true),"[Failed] - Paypal Sandbox might be down!"
  @app.paypal_page.paypal_signin
end

And(/^I continue with the paypal checkout$/) do
  @app.paypal_page.continue
end
