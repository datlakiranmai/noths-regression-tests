Feature: Login [Legacy user]
  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @e2e_cognito_check @cog_e2e @27.01
  Scenario: [Legacy user] 27.01 - A customer is able to successfully login via the header
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    #And I should see user created in cognito
    #And I should see user created in cognito account table

  @e2e_cognito_check @cog_e2e @27.02
  Scenario: [Legacy user] 27.02 - A customer is able to successfully login via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my favourites
    When I click on Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    When I click on Favourite SignIn
    And I sign in with my new credentials
    When I navigate to My accounts page
    And I choose my details from my account section
    Then I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    #Then I should see user created in cognito
    #And I should see user created in cognito account table