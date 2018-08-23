Feature: Registration
  As a visitor
  I want to be able to register online
  So that I can purchase gorgeous things online, create a wishlist and, receive exclusive news of special offers and updates

  Background:
    Given the user_account flag is turn on
    And I am on Home page

  @mobile_e2e_regression_tests @mobile @17.01
  Scenario: Customer is able is successfully register in site via header
    When I navigate to my accounts
    And I click on Register
    And I enter in my details in sign up form
    And I check the privacy policy
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see my email address in my accounts page


  @mobile_e2e_regression_tests @mobile @17.02
  Scenario: Customer is able is successfully register in site via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my favourites
    When I click on Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I check the privacy policy
    And I click Submit button
    And I navigate to my accounts
    And I click link to go to my details
    And I should see my email address in my accounts page
