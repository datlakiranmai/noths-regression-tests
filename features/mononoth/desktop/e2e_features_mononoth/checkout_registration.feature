Feature: Checkout Registration
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given I am on Home page

  @smoke_tests @e2e @5.01
  Scenario: 5.01 - A customer should be able to register during the checkout of a standard product
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
    And I provide the payment details
    Then I should see order confirmation page

  @smoke_tests @e2e @5.02
  Scenario: 5.02 - A customer should be able to register during the gift voucher checkout
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide the payment details
    Then I should see order confirmation page