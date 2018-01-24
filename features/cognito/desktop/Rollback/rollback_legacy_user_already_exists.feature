Feature: User already exists [Rollback Legacy user]
  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page
  I turn the Cognito flag OFF
  I register myself again

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @e2e_cognito_check @cog_e2e @171.01
  Scenario: [Rollback - Legacy user] 171.01 - A customer is able to successfully login via the header
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag OFF as admin
    And I navigate to home page
    And I check my rollback flag is OFF
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]

    #And I should see user created in cognito
    #And I should see user created in cognito account table

  @e2e_cognito_check @cog_e2e @171.02
  Scenario: [Rollback - Legacy user] 171.02 - A customer is able to successfully login via favourites
    When I click on Favourite
    When I click on Create new folder
    And I sign in with my new credentials
    When I navigate to My accounts page
    And I choose my details from my account section
    Then I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Favourite
    When I click on Create new folder
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up
    When I click on Favourite
    When I click on Create new folder
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag OFF as admin
    And I navigate to home page
    And I check my rollback flag is OFF
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    #Then I should see user created in cognito
    #And I should see user created in cognito account table