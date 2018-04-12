Feature: Checkout Login [Legacy user]

  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON


  @e2e_cognito_check @cog_e2e @26.01
  Scenario: [Legacy user] 26.01 - A customer should be able to login during the checkout of a standard product
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
    #Then I should see user created in cognito
    #And I should see user created in cognito account table


  @e2e_cognito_check @cog_e2e @26.02
  Scenario: [Legacy user] 26.02 - A customer should be able to login during the gift voucher checkout
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with my new credentials
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide MasterCard payment details
    Then I should see order confirmation page
    #Then I should see user created in cognito
    #And I should see user created in cognito account table