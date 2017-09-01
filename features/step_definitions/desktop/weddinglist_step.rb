And(/^I should be navigated to the (.*) page$/) do |pagename|
  expect(@app.home.user_logged_in?).to be(true)
  expect(@app.weddinglist.navigated_to_weddinglist?).to be(true)
  expect((@app.weddinglist.wedding_list_page_title.text).eql?(pagename.upcase)).to be(true),"Redirection Failure - User is NOT redirected to the Wedding List page!"
end