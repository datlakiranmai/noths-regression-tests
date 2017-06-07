And(/^I enter my details in gift voucher form$/) do
  @app.gift_voucher.enter_gift_voucher_form
end

And(/^I checkout gift voucher$/) do
  @app.gift_voucher.checkout
end