Feature: User registeration with a already existing email address
  As a customer
  I want to register to noths website
  with an already existing email address

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @cog_e2e @42.01
  Scenario: Customer should see 'user already exists' message if existing email address is used (Standard products)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in existing details in your details form
    And I Continue to next page
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @cog_e2e @42.02
  Scenario: Customer should see 'user already exists' message if existing email address is used (gift voucher)
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in existing details in your details form
    And I Continue to next page
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @cog_e2e @42.03
  Scenario: Customer should see 'user already exists' message if existing email address is used in registration form(via header)
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @cog_e2e @42.04
  Scenario: Customer should see 'user already exists' message if existing email address is used in registration form(via favourites)
    When I click on Favourite
    And I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error message saying Please check your details before continuing
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up