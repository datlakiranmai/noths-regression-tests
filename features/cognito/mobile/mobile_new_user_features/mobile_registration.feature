Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

 Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @smoke_tests_mobile @cog_mobile_e2e @67.01
  Scenario: Customer is able is successfully register in site via header
    When I navigate to my accounts
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page

  @smoke_tests_mobile @cog_mobile_e2e_check @67.01a
  Scenario: Customer is able is successfully register in site via header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table

  @smoke_tests_mobile @cog_mobile @67.02
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page

  @smoke_tests_mobile @cog_mobile_e2e_check @67.02a
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table