Feature: Mobile signin temporary
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I register as a new user via mobile
    And I signout from my account

  @smoke_tests_mobile @mobile @16.01
  Scenario: Customer should be able to purchase a product as a registered user
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I choose to sign in
    And I sign in with my new credentials
    And I Continue to next page
    And I enter in my address details
    And I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see Thank you for your order message


  @smoke_tests_mobile @mobile @16.02
  Scenario: Customer should be able to purchase a gift voucher as a registered user
    When I navigate to my shopping
    And  I click link to go to gift vouchers
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I choose to sign in
    And I sign in with my new credentials
    #And I specify my card type
    And I provide VisaDebit payment details
    Then I should see Thank you for your order message


