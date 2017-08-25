Feature: Wish List
  As a customer/guest
  I want to save a product in my wish list


  @e2e @101.01
  Scenario: 101.01 - A registered customer is able to save a product for later in the wish list.
    Given I register as a new user
    And I sign out from my account
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wish list
    And I sign in with my new credentials
    And I should be navigated to manage my list page

  @e2e @101.02
  Scenario: 101.02 - A new customer is able to save a product for later in the wish list.
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wish list
    And I click on Sign up
    And I enter in my details in your details form
    And I click Submit button
    And I should be navigated to manage my list page