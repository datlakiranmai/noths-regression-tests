Feature: Checkout Login [Rollback New user]
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
#    Given I enable the cognito flag ON as admin
#    And I navigate to home page
#    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @cog_e2e @178.01
  Scenario: [Rollback New user] 178.01 - A customer should be able to login during the checkout of a standard product
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
    And I close mention me popup
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    #And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see order confirmation page

  @cog_e2e @178.02
  Scenario: [Rollback New user] 178.02 - A customer should be able to login during the gift voucher checkout
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with my new credentials
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide VisaDebit payment details
    Then I should see order confirmation page
    And I close mention me popup
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with my new credentials
    And I expect NOT to see signin failure
    #And I enter in my address details
    And I should see the my email address in summary section
    And I provide MasterCard payment details
    Then I should see order confirmation page