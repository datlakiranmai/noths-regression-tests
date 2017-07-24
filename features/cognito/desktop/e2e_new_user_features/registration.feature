Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

 Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @cog_e2e @39.01
  Scenario: 39.01 - A potential customer is able to successfully register via the header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @e2e_cognito_check @39.01a
  Scenario: 39.01a - A potential customer is able to successfully register via the header and is confirmed within AWS
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table

  @cog_e2e @39.02
  Scenario: 39.02 - A potential customer is able to successfully register via favourites
    When I click on Favourite
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @e2e_cognito_check @39.02a
  Scenario: 39.02a - A potential customer is able to successfully register via favourites and is confirmed within AWS
    When I click on Favourite
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table