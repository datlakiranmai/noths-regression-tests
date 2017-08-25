And(/^I should be navigated to the (.*) page$/) do |pagename|
  puts "text is #{@app.weddinglist.wedding_list_page_title.text}"
  expect((@app.weddinglist.wedding_list_page_title.text).eql?(pagename.upcase)).to be(true),"Redirection Failure - User is NOT redirected to the wedding list page!"
end