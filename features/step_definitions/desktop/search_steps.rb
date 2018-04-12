Then(/^I should be taken to search results$/) do
  expect(@app.search.search_page?).to eq(true)
end

Then(/^I should see my page title as (.*)$/) do |category_name|
  expect(@app.search.category_title.text.downcase).to eq(category_name.downcase)
end


Then(/^I should see the respective products$/) do
  expect(@app.search.searched_products_count.to_s).to eq(@app.search.no_of_search_items)
end


When(/^I filter (.*) delivery option$/) do |delivery_option|
  @app.search.select_search_option(delivery_option)
end

Then(/^I should see free delivery label under all the products$/) do
  expect(@app.search.searched_products_count).to eq(@app.search.free_delivery_labels_count)
end


Then(/^I should see a label as (.*)/)do |label_name|
  expect(@app.search.free_delivery_labels?).to eq(true)
end


Then(/^I should see images for all the products/) do
  expect(@app.search.product_images_displayed?).to eq(true)
end

Then(/^I should see product title for all the products/) do
  @app.search.product_title_displayed?
end

Then(/^I should see price tags for all the products/) do
  puts @app.search.price_tags_displayed?
end