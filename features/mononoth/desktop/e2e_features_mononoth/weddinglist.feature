Feature: Wedding List
  As a customer/guest
  I want to save a product in my wedding list


  @e2e @102.01
  Scenario: 102.01 - A registered customer is able to save a product for later in the wedding list.
    Given I register as a new user
    And I sign out from my account
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wedding list
    And I sign in with my new credentials
    And I should be navigated to the overview page

  @e2e @102.02
  Scenario: 102.02 - A new customer is able to save a product for later in the wedding list.
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I add the product to the wedding list
    And I click on Sign up
    And I enter in my details in your details form
    And I click Submit button
    And I should be navigated to the overview page