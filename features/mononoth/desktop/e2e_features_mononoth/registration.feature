Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given I am on Home page

  @smoke_tests @e2e @1.01
  Scenario: 1.01 - A potential customer is able to successfully register via the header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page


  @smoke_tests @e2e @1.02
  Scenario: 1.02 - A potential customer is able to successfully register via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my favourites
    When I click on Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page