Feature: Mobile signin temporary
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I am on Home page

  @mobile @15.01
  Scenario: Customer should be able to purchase a product as a registered user
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter my login credentials:
      | user_name | clair@test.com |
      | password  | clair@test.com |
    And I Continue to next page
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
    Then I should see Thank you for your order message


  @mobile @15.02
  Scenario: Customer should be able to purchase a gift voucher as a registered user
    When I navigate to my shopping
    And  I click link to go to gift vouchers
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter my login credentials:
      | user_name | clair@test.com |
      | password  | clair@test.com |
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
    Then I should see order confirmation page