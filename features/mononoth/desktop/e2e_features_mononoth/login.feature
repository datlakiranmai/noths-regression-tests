Feature: Login
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I navigate to home page
    And I check and enable the user_account flag
And I register as a new user
    And I sign out from my account

  @p1 @smoke_tests @e2e @e2e_staging @no_poltergeist @2.01
  Scenario: 2.01 - A customer is able to successfully login via the header
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page

  @p1 @smoke_tests @e2e_staging @e2e @no_poltergeist @2.02
  Scenario: 2.02 - A customer is able to successfully login via favourites
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my favourites
    When I click on Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    When I click on Favourite SignIn
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page