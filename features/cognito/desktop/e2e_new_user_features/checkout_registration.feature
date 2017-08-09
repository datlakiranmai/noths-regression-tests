Feature: Checkout Registration
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @cog_e2e @37.01
  Scenario: [New user] 37.01 - A customer should be able to register during the checkout of a standard product
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in my details in your details form
    And I select my country code as United Kingdom
    And I provide my contact number as 07 299 571 109
    And I Continue to next page
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
    Then I should see order confirmation page

  @e2e_cognito_check @37.01a
  Scenario: [New user] 37.01a - A customer should be able to register during the checkout of a standard product and is confirmed within AWS
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
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table

  @cog_e2e @37.02
  Scenario: [New user] 37.02 - A customer should be able to register during the gift voucher checkout
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I select my country code as Germany
    And I provide my contact number as 069 299 571 109
    And I Continue to next page
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide the payment details
    Then I should see order confirmation page

  @e2e_cognito_check @37.02a
  Scenario: [New user] 37.02a - A customer should be able to register during the gift voucher checkout and is confirmed within AWS
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in my details in your details form
    And I Continue to next page
    And I enter in my address details
    And I should see the my email address in summary section
    And I provide the payment details
    #Then I should see order confirmation page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table