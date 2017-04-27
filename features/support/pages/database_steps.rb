
And(/^I verify (.*) exist in noths database$/) do |email_address|
   if CognitoUserTable.user_exists?(email_address)
     @user_id=CognitoUserTable.user_id(email_address)
   else
     raise "Legacy NOTHS user doesn't exist in noths-qa db... Please choose a different user account"
   end
end


And(/^I delete the user from cognito Account table$/) do
  CognitoUserTable.delete_user(@user_id)
end