And(/^I should be navigated to (.*) page$/) do |pagename|
  expect(@app.wishlist.navigated_to_wish_list_page?).to be(true), "Redirection Failure - User is NOT redirected to the Wish List page!"
  expect((@app.wishlist.wish_list_page_title.text).eql?(pagename.upcase)).to be(true)
end