Feature: Login [New User]
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
#    Given I enable the cognito flag ON as admin
#    And I navigate to home page
#    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @error_msg_check @cog_e2e @no_poltergeist @38.01
  Scenario: [New user] 38.01 - A customer is able to successfully login via the header
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]


  @cog_e2e @no_poltergeist @38.02
  Scenario: [New user] 38.02 - A customer is able to successfully login via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
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
    And I should see my country code as United Kingdom [44]