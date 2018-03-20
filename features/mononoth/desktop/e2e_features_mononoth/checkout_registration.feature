Feature: Checkout Registration
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given I am on Home page

  @payments @smoke_tests @e2e @5.01
  Scenario: 5.01 - Checkout E2E - A customer should be able to register during the checkout of a standard product(Card Payment)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see order confirmation page

  @smoke_tests @e2e @5.02
  Scenario: 5.02 - Checkout E2E - A customer should be able to register during the gift voucher checkout
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide VisaDebit payment details
    Then I should see order confirmation page

  @payments @5.03
  Scenario: 5.03 - Checkout E2E - A customer should be able to checkout a standard product(Paypal express)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket and do not want to checkout
    And I choose to pay via paypal express
    Then I enter my paypal login credentials
    And I continue with the paypal checkout
    And I click on pay now button
    Then I should see order confirmation page

 @payments @e2e @5.04
  Scenario: 5.04 - Checkout E2E - A customer should be able to checkout a standard product(Paypal Mark)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I choose to pay via paypal
    Then I enter my paypal login credentials
    And I continue with the paypal checkout
    Then I should see order confirmation page