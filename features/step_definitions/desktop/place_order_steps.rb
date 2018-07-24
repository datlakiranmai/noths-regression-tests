And(/^I add the product in my basket$/) do
  @app.add_to_basket.add_the_product_in_basket
end

And(/^I add the product in my basket and do not want to checkout$/) do
  @app.add_to_basket.add_the_product_to_basket_page_and_do_not_proceed
end

And(/^I specify my card type$/) do
  expect(@app.payment.payment_option?).to eq(true),"[Failed] - Payments options are not displayed!"
  @app.payment.select_card_type
end

And(/^I provide (.*) payment details$/) do |card_type|
  #expect(@app.payment.credit_card_type?).to eq(true),"[Failed] - Payments page is not displayed!"
  @app.payment.submit_payment(card_type)
end


And(/^I click on voucher code link$/) do
  @app.payment.select_voucher_code
end

And(/^I apply my gift voucher code$/) do
  @app.payment.apply_voucher_code(@app.my_orders.voucher_code)
end

Then(/^I should see (.*) as my delivery recipient$/) do |delivery_recipient|
  @delivery_recipient=delivery_recipient.downcase
  expect(@app.your_order.delivery_recipient.text.downcase).to have_text(@delivery_recipient)
end

And(/^I should see (.*) as my delivery address$/) do |delivery_address|
  @delivery_address=delivery_address.downcase
  expect(@app.your_order.delivery_addressline1.text.downcase).to have_text(@delivery_address)
end

When(/^I continue with my delivery address$/) do
  @app.your_order.click_continue_btn
end

And(/^I should see the my email address in summary section$/) do
  expect(@app.your_order.summary_user_email_address).to have_text(@username)
end


Then(/^I should see my name as delivery recipient$/) do
  expect(@app.your_order.delivery_recipient.text.downcase).to have_text("#{@app.registration.first_name} #{@app.registration.last_name}")
end

Then(/^I should see (.*) message$/) do |message|
expect(@app.order_confirmation.order_completed_status).to have_text("YOUR ORDER HAS BEEN SUCCESSFUL"),"[Failed] - Order Completion Page is not displayed!"
end


Then(/^I should see order confirmation page$/) do
  if @app.registration.first_name
    expect(@app.order_confirmation.title_order_completed?).to eq(true),"[Failed] - Order Completion page is not displayed!"
    expect(@app.order_confirmation.title_order_completed.text.downcase).to eq("thank you for your order, #{@app.registration.first_name.downcase} #{@app.registration.last_name.downcase}"),"[Failed] - Order Completion Page is not displayed!"
  end
  expect(@app.order_confirmation.thank_you_for_order.text.downcase).to have_text("order completed"),"[Failed] - Order Completion Page is not displayed!"
  expect(@app.order_confirmation.order_completed_status.text.downcase).to have_text("your order has been successful"),"[Failed] - Order Completion Page is not displayed!"
end


And(/^I close mention me popup$/) do
  @app.order_confirmation.handle_mm_popup
end

And(/^I add the product to the wish list$/) do
  @app.add_to_basket.add_the_product_to_wishlist
end

And(/^I add the product to the wedding list$/) do
  @app.add_to_basket.add_the_product_to_weddinglist
end


And(/^I choose to pay via paypal express$/) do
  @app.add_to_basket.select_paypal_express_checkout
end

And(/^I click on pay now button$/) do
  @app.your_order.click_paynow_button
end

And(/^I choose to pay via paypal$/) do
  @app.payment.select_paypal
end

