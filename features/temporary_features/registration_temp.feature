Feature: Temporary Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given I am on Home page

  @demo @7.01
  Scenario: Customer is able is successfully register in site via header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table


  @demo  @7.02
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table