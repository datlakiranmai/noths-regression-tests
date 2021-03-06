And(/^I enable the cognito flag (.*) as admin$/) do |status|
    @app.home.navigate_to_admin
    sleep 1
    @app.login.admin_signin_credentials
    @app.home.navigate_to_site_features
    @app.home.turn_cognito_flag(status)
end

And(/^I check my cognito flag is (.*)$/) do |status|
  expect(@app.home.check_cognito_flag(status)).to eq(true)
end


Given(/^I enable the rollback flag (.*) as admin$/) do |status|
    @app.home.navigate_to_admin
    sleep 1
    @app.login.admin_signin_credentials
    @app.home.navigate_to_site_features
    @app.home.turn_rollback_flag(status)
end

And(/^I check my rollback flag is (.*)$/) do |status|
    expect(@app.home.check_rollback_flag(status)).to eq(true)
end

Given(/^I enable third_party_gift_cards feature flag$/) do
  @app.home.navigate_to_admin
  sleep 1
  @app.login.admin_signin_credentials
  @app.home.navigate_to_site_features
  @app.home.turn_gift_cards_flag
end

And(/^I check and enable the user_account flag$/) do
  if !@app.home.check_user_account_flag
    @app.home.navigate_to_admin
    sleep 1
    @app.login.admin_signin_credentials
    @app.home.navigate_to_site_features
    sleep 1
    @app.home.turn_user_account_flag
  end
end