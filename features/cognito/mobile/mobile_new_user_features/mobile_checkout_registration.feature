Feature: Mobile Checkout_registration temporary
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @smoke_tests_mobile @cog_mobile_e2e @65.01
  Scenario: Customer should be able to purchase a product as a registered user
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
    Then I should see Thank you for your order message


  @smoke_tests_mobile @cog_mobile_e2e @65.02
  Scenario: Customer should be able to purchase a gift voucher as a registered user
    When I navigate to my shopping
    And  I click link to go to gift vouchers
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    And I provide the payment details
    Then I should see Thank you for your order message


#  @cog_mobile_e2e @45.03
#  Scenario: Customer should see 'user already exists' message if existing email address is used (Standard products)
#    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
#    And I add the product in my basket
#    And I click on Continue
#    And I enter in existing details in your details form
#      | user_name | 1496669633@sharklasers.com |
#      | password  | password           |
#    And I Continue to next page
#    Then I should see error message saying Please check your details before continuing
#    And I should see info message saying To use this email address simply sign in before continuing.
#
#  @cog_mobile_e2e @45.04
#  Scenario: Customer should see 'user already exists' message if existing email address is used (gift voucher)
#    When I navigate to my shopping
#    And  I click link to go to gift vouchers
#    And I enter my details in gift voucher form
#    And I checkout gift voucher
#    And I click on Continue
#    And I enter in existing details in your details form
#      | user_name | 1496669633@sharklasers.com |
#      | password  | password           |
#    And I Continue to next page
#    Then I should see error message saying Please check your details before continuing
#    And I should see info message saying To use this email address simply sign in before continuing.
