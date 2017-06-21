Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @cog_e2e @21.01
  Scenario: Customer is able is successfully register in site via header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @cog_e2e_coginito_check @21.01a
  Scenario: Customer is able is successfully register in site via header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table


  @cog_e2e @21.02
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @cog_e2e_coginito_check @21.02a
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should register successfully
    And I navigate to My accounts page
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table