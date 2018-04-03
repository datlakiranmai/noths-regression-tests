Then(/^I enter my paypal login credentials$/) do
  @app.paypal_page.wait_for_paypal_page
  @app.paypal_page.paypal_signin
end

And(/^I continue with the paypal checkout$/) do
  @app.paypal_page.continue
end
