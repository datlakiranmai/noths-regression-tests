Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given I am on Home page

  @e2e @1.01
  Scenario: Customer is able is successfully register in site via header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    #Then I should register successfully
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page


  @e2e @1.02
  Scenario: Customer is able is successfully register in site via favourites
    When I click on Favourite
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    #Then I should register successfully
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
