 And(/^I navigate to My accounts page$/) do
   @home_page.navigate_to_myaccounts
 end

 And(/^I should be taken to (.*) page$/) do |pagename|
   #@mydetails_page.check_page_name(pagename)
   expect(@mydetails_page.my_details_page.text.eql?(pagename.upcase))
 end

 And(/^I choose (.*) from my account section$/) do |option|
    @mydetails_page.click_on(option)
 end

 And(/^I should see the my email address in my accounts page$/) do
   puts @mydetails_page.my_details_address.value
   expect(@mydetails_page.my_details_address.value).to have_text(@signup_page.email_address)
 end

