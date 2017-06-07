Feature: Checkout_registration temporary
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given I am on Home page

  @temp @10.01
  Scenario: Customer should be able to purchase a product as a registered user
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table


  @temp @10.02
  Scenario: Customer should be able to purchase a gift voucher as a registered user
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table

  @temp @10.03
  Scenario: Customer should see 'user already exists' message if existing email address is used (Standard products)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in existing details in your details form
      | user_name | 1496680229@sharklasers.com |
      | password  | password                   |
    And I Continue to next page
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.


  @temp @10.04
  Scenario: Customer should see 'user already exists' message if existing email address is used (gift voucher)
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in existing details in your details form
      | user_name | 1496680229@sharklasers.com |
      | password  | password                   |
    And I Continue to next page
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.
