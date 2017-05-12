 And(/^I navigate to My accounts page$/) do
   @app.home.navigate_to_myaccounts
 end

 And(/^I should be taken to (.*) page$/) do |pagename|
   #@mydetails_page.check_page_name(pagename)
   expect(@app.my_details.my_details_page.text.eql?(pagename.upcase))
 end

 And(/^I choose (.*) from my account section$/) do |option|
    @app.my_details.click_on(option)
 end

 And(/^I should see the my email address in my accounts page$/) do
   puts @app.my_details.my_details_address.value
   expect(@app.my_details.my_details_address.value).to have_text(@app.registration.email_address)
 end

