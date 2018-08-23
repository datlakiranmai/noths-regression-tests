Feature: Login_mobile
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given the user_account flag is turn on
    And  I register as a new user via mobile
    And I signout from my account
    And I navigate to home page

  @mobile_e2e_regression_tests @mobile @18.01
  Scenario: Customer is able to successfully login to notonthehighstreet (standard product)
    When I navigate to my accounts
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see my email address in my accounts page


  @mobile_e2e_regression_tests @mobile @18.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my favourites
    When I click on Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    When I click on Favourite SignIn
    And I sign in with my new credentials
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see my email address in my accounts page