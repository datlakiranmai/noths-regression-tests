Feature: Legacy Checkout login

  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @legacy @16.01
  Scenario: Customer should be able to purchase a product as a customer
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
    Then I should see order confirmation page

<<<<<<< HEAD:features/legacy_user_features/legacy_checkout_login.feature
  @legacy @7.02
=======
  @legacy @16.02
>>>>>>> master:features/cognito/desktop/e2e_legacy_user_features/legacy_checkout_login.feature
  Scenario: Customer should be able to purchase a gift voucher as a customer
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with my new credentials
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide the payment details
    Then I should see order confirmation page