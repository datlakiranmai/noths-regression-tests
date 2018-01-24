
And(/^I am redirected to the (.*) page$/)  do |page_title|
  expect(@app.favouritespage.favourites_page_title.downcase).to eq(page_title.downcase)
end

And(/^I click on my favourites product image$/)  do
  @app.favouritespage.click_on_product_image
end

And(/^I click on Create new folder$/)  do
  @app.favouritespage.click_on_create_new_folder
end
