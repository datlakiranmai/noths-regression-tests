
And(/^I verify (.*) exist in noths database$/) do |email_address|
   if CognitoUserTable.user_exists_in_user_table?(email_address)
     @user_id=CognitoUserTable.user_id(email_address)
   else
     raise "Legacy NOTHS user doesn't exist in noths-qa db... Please choose a different user account"
   end
end

And(/^I delete the user from cognito Account table$/) do
  CognitoUserTable.delete_user(@user_id)
end


And(/^I should see user created in user table$/) do
  expect(CognitoUserTable.user_exists_in_user_table?($email_address)).to eq(true)
end


And(/^I should see user created in cognito account table$/) do
  expect(CognitoUserTable.user_exists_in_cognito_table?(CognitoUserTable.user_id($email_address))).to eq(true)
end

And(/^I should see user password in user table is empty$/) do
  expect(CognitoUserTable.get_password_field_value($email_address)).to be_nil
end