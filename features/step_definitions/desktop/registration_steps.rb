
And(/^I enter in my details in sign up form$/) do
  @app.registration.enter_user_details
end

And(/^I click (.*) button$/) do |button_name|
  puts "User email address is #{$email_address}"
  @app.registration.click_on_button(button_name)
end

Then(/^I should register successfully$/) do
  name="#{@app.registration.first_name} #{@app.registration.last_name}"
  expect(@app.home.signed_in_user.text.downcase).to have_text(name)
end

When(/^I go for (.*) from wishlist page$/) do |button_name|
  @app.wishlist.click_on(button_name)
end


And(/^I enter in my details in your details form$/) do
  @app.registration.enter_your_details_in_checkout
end

And(/^I enter in my address details$/) do
  @app.registration.enter_address_details
end

And(/^I Continue to next page$/) do
  @app.registration.click_on_button('Continue')
end


And(/^I enter in existing details in your details form$/) do |table|
  # table is a table.hashes.keys # => [:user_name, :1494856618@sharklasers.com]
  table.raw.each do |key, value|
    if key == 'user_name' then
      $email_address = value
    else
      @password = value
    end
  end
  @app.registration.enter_existing_user_details($email_address, @password)
end

Then(/^I should see error message saying (.*)$/) do |error_title|
  expect(@app.registration.error_title.text.downcase).to eq(error_title.downcase)
end

And(/^I should see info message saying (.*)$/) do |info_message|
  expect(@app.registration.info_message.text.downcase).to eq(info_message.downcase)
end