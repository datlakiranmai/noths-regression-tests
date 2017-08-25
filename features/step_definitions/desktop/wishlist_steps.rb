And(/^I should be navigated to (.*) page$/) do |pagename|
  puts "text is #{@app.wishlist.wish_list_page_title.text}"
  expect((@app.wishlist.wish_list_page_title.text).eql?(pagename.upcase)).to be(true), "Redirection Failure - User is NOT redirected to the wish list page!"
end
