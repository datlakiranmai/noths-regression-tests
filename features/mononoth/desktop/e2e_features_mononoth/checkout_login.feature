Feature: Checkout Login
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I register as a new user
    And I sign out from my account

  @payments @e2e @3.01
  Scenario: 3.01 - Checkout E2E - Customer should be able to purchase a product as a customer( Visa Debit or Electron)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see order confirmation page

  @payments @e2e @3.02
  Scenario: 3.02 - Checkout E2E - Customer should be able to purchase a product as a customer (MasterCard)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide MasterCard payment details
    Then I should see order confirmation page

  @payments @e2e @3.03
  Scenario: 3.03 - Checkout E2E - Customer should be able to purchase a product as a customer (Visa)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide Visa payment details
    Then I should see order confirmation page

  @payments @e2e @3.04
  Scenario: 3.04 - Checkout E2E - Customer should be able to purchase a product as a customer (American Express)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide AmericanExpress payment details
    Then I should see order confirmation page


  @payments @e2e @3.05
  Scenario: 3.05 - Checkout E2E - Customer should be able to purchase a product as a customer (paypal Mark)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I choose to pay via paypal
    Then I enter my paypal login credentials
    And I continue with the paypal checkout
    Then I should see order confirmation page

  @smoke_tests @e2e @3.06
  Scenario: 3.06 - Checkout E2E - A customer should be able to login during the gift voucher checkout
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with my new credentials
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide VisaDebit payment details
    Then I should see order confirmation page