And(/^I check my giftcard voucher code$/) do
  @app.my_orders.check_voucher_code
end

And(/^I choose to view my orders page$/) do
  @app.my_orders.click_on_myorders
end
