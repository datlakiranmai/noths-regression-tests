Feature: Sign In failure
  As a customer
  I want to sign in to noths website
  with an invalid password

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @smoke_tests @cog_e2e @40.01
  Scenario: 40.01 - Password field should get cleared when a user signs in with an invalid password during checkout of standard products
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with invalid password
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up

  @smoke_tests @cog_e2e @40.02
  Scenario: 40.02 - Password field should get cleared when a user signs in with an invalid password during the gift voucher checkout
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with invalid password
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up

  @smoke_tests @cog_e2e @40.03
  Scenario: 40.03 - Password field should get cleared when a user signs in with an invalid password via the header
    When I navigate to home page
    And I click on Signin
    And I sign in with invalid password
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up

  @smoke_tests @cog_e2e @40.04
  Scenario: 40.04 - Password field should get cleared when a user signs in with an invalid password via favourites
    When I click on Favourite
    When I click on Favourite SignIn
    And I sign in with invalid password
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up

  @smoke_tests @cog_e2e @40.05
  Scenario: 40.05 - Password field should get cleared when a user signs in with an invalid email address during checkout of standard products
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with invalid email address
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up