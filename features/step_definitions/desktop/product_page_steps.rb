
And(/^I add the product in my favourites$/) do
  @app.productpage.click_on_favourites_button
end

Then(/^I am taken to (.*) product page$/) do |product_name|
  expect(@app.productpage.current_product.text.downcase).to eq(product_name.downcase),"[Failed] - Current Product title doesn't match with the expected title"
  expect(@app.productpage.product_title.text.downcase).to eq(product_name.downcase),"[Failed] - Product title doesn't match with the expected title"
end

And(/^I see a product image$/) do
  expect(@app.productpage.product_image_displayed?).to eq(true),"[Failed] - Product Image is missing"
end

And(/^I see the product delivery information$/) do
  expect(@app.productpage.free_delivery_msg.text).not_to be_empty,"[Failed] - Free delivery message is missing"
  expect(@app.productpage.express_delivery_msg.text).not_to be_empty,"[Failed] - Next day delivery message is missing"
  expect(@app.productpage.saturday_delivery_msg.text).not_to be_empty,"[Failed] - Saturday delivery message is missing"
end

And(/^I see (.*) button$/) do |button_name|
  expect(@app.productpage.add_to_basket_button).to be(button_name.upcase),"[Failed] - Add to basket button is missing"
end

And(/^I see (.*) as product price$/) do |product_price|
  expect(@app.productpage.product_price.text).to eq(product_price),"[Failed] - Product price doesn't match with the expected product price"
end

And(/^I see the below product delivery information$/) do |delivery_information|
  @app.productpage.close_survey_popup
  delivery_information.hashes.each do |type|
    expect(type[:delivery_message]).to eq(@app.productpage.delivery_price(type[:delivery_type])),"[Failed] - Product price doesn't match with the expected product price"
  end
end

And(/^I see a valid estimated delivery date for each delivery type$/) do
  expect(@app.productpage.valid_estimate_delivery_dates?).to eq(true),"[Failed] - Estimated delivery date is not in valid format"
  expect(@app.productpage.valid_estimate_delivery_days?).to eq(true),"[Failed] - Estimated delivery day is not in valid format"
  expect(@app.productpage.valid_estimate_delivery_months?).to eq(true),"[Failed] - Estimated delivery month is not in valid format"
end