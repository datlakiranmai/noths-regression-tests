And(/^I add the product in my basket$/) do
  @add_to_basket=AddToBasket.new
  @add_to_basket.add_the_product_in_basket
end

And(/^I specify my card type$/) do
  @payment.select_card_type
end

And(/^I provide the payment details$/) do
  @payment.submit_payment
end


Then(/^I should see (.*) as my delivery recipient$/) do |delivery_recipient|
  @delivery_recipient=delivery_recipient.downcase
  expect(@your_order.delivery_recipient.text.downcase).to have_text(@delivery_recipient)
end

And(/^I should see (.*) as my delivery address$/) do |delivery_address|
  @delivery_address=delivery_address.downcase
  expect(@your_order.delivery_addressline1.text.downcase).to have_text(@delivery_address)
end

When(/^I continue with my delivery address$/) do
  @your_order.click_continue_btn
end

And(/^I should see the my email address in summary section$/) do
  expect(@your_order.summary_user_email_address).to have_text(@username)
end


Then(/^I should see my name as delivery recipient$/) do
  expect(@your_order.delivery_recipient.text.downcase).to have_text("#{@signup_page.first_name} #{@signup_page.last_name}")
end

Then(/^I expect to see Thank you for your order, (.*)$/) do |user_name|
  @order_confirmation = OrderConfirmation.new
    expect(@order_confirmation.title_order_completed).to have_text("Thank you for your order, #{user_name}")
  expect(@order_confirmation.thank_you_for_order).to have_text("ORDER COMPLETED")
  expect(@order_confirmation.order_completed_status).to have_text("YOUR ORDER HAS BEEN SUCCESSFUL")
end


Then(/^I should see order confirmation page$/) do
  @order_confirmation = OrderConfirmation.new
  expect(@order_confirmation.title_order_completed).to have_text("Thank you for your order, #{@signup_page.first_name.capitalize} #{@signup_page.last_name.capitalize}")
  expect(@order_confirmation.thank_you_for_order).to have_text("ORDER COMPLETED")
  expect(@order_confirmation.order_completed_status).to have_text("YOUR ORDER HAS BEEN SUCCESSFUL")
end


