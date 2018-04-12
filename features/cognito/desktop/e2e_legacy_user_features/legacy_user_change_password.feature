Feature: Change Password [Legacy user]

  As a noths customer
  I should be able to reset password via my details page


  @smoke_tests @cog_e2e @30.01
  Scenario: [Legacy user] 30.01 - A customer should be able to reset their password on the my details page
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I change my existing password in my details page
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page


  @smoke_tests @cog_e2e @30.02
  Scenario: [Legacy user] 30.02 - A customer who is already signed in via Mononoth should be able to reset their password on the my details page
    Given I register as a new user
    And I sign out from my account
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I change my existing password in my details page
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page
    And I sign out from my account
    And I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page
