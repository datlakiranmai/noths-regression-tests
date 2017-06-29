Then(/^I should see user created in cognito$/) do
  sleep 10
  expect(CognitoIdentityProviderPool.identity_exists?($email_address).user_status).to eq('CONFIRMED')
end


