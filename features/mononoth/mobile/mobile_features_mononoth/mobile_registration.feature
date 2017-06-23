Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given I am on Home page

  @mobile @17.01
  Scenario: Customer is able is successfully register in site via header
    When I navigate to my accounts
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page


  @mobile @17.02
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see the my email address in my accounts page
