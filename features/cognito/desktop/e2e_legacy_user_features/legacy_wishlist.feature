Feature: Wish List [Legacy user]
  As a customer/guest
  I want to save a product in my wish list

  Background:
    Given I register as a new user
    And I sign out from my account
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @cog_e2e @105.01
  Scenario: 105.01 - A registered customer is able to save a product for later in the wish list.
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wish list
    And I sign in with my new credentials
    And I should be navigated to manage my list page