Feature: Wedding List [New user]
  As a customer/guest
  I want to save a product in my wedding list

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @cog_e2e @103.01
  Scenario: 103.01 - A registered customer is able to save a product for later in the wedding list.
    Given I register as a new user
    And I sign out from my account
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wedding list
    And I sign in with my new credentials
    And I should be navigated to the overview page

  @cog_e2e @103.02
  Scenario: 103.02 - A new customer is able to save a product for later in the wedding list.
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wedding list
    And I click on Sign up
    And I enter in my details in your details form
    And I click Submit button
    And I should be navigated to the overview page