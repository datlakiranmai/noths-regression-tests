And(/^I should be navigated to (.*) page$/) do |pagename|
  expect(@app.home.user_logged_in?).to be(true)
  expect(@app.wishlist.navigated_to_wishlist?).eql?(true)
  expect((@app.wishlist.wish_list_page_title.text).eql?(pagename.upcase)).to be(true), "Redirection Failure - User is NOT redirected to the Wish List page!"
end