
And(/^I enter in my details in sign up form$/) do
  @signup_page.enter_user_details
end

And(/^I click (.*) button$/) do |button_name|
  puts "User email address is #{$email_address}"
  @signup_page.click_on_button(button_name)
end

Then(/^I should register successfully$/) do
  name="#{@signup_page.first_name} #{@signup_page.last_name}"
  expect(@home_page.signed_in_user.text.downcase).to have_text(name)
end

When(/^I go for (.*) from wishlist page$/) do |button_name|
  @wishlist=Wishlist.new
  @wishlist.click_on(button_name)
end


And(/^I enter in my details in your details form$/) do
  @signup_page.enter_your_details_in_checkout
end

And(/^I enter in my address details$/) do
  @signup_page.enter_address_details
end

And(/^I Continue to next page$/) do
  @signup_page.click_on_button('Continue')
end
