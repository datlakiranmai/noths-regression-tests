Then(/^I should be taken to search results$/) do
  expect(@app.search.search_page?).to eq(true)
end


Then(/^I should see my page title as (.*)$/) do |category_name|
  expect(@app.search.category_title.text.downcase).to eq(category_name.downcase)
end