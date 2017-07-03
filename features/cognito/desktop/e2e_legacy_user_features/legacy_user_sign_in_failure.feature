Feature: Legacy user Sign In failure (Invalid email address / password)

  As a customer
  I want to sign in to noths website
  with an invalid password

  Background:
    Given I register as a new user
    And I sign out from my account
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @legacy @29.01
  Scenario: Password field data should get cleared when user signs in with invalid password (checkout standard products)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with invalid password
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.02
  Scenario: Password field data should get cleared when user signs in with invalid password (checkout gift voucher)
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with invalid password
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.03
  Scenario: Password field data should get cleared when user signs in with invalid password (checkout gift voucher)(via header)
    When I navigate to home page
    And I click on Signin
    And I sign in with invalid password
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.04
  Scenario: Password field data should get cleared when user signs in with invalid password (checkout gift voucher)(via favourites)
    When I click on Favourite
    When I click on Favourite SignIn
    And I sign in with invalid password
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.05
  Scenario: Password field data should get cleared when user signs in with invalid email address (checkout standard products)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with invalid email address
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.06
  Scenario: Password field data should get cleared when user signs in with invalid email address (checkout gift voucher)
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I sign in with invalid email address
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.07
  Scenario: Password field data should get cleared when user signs in with invalid email address (checkout gift voucher)(via header)
    When I navigate to home page
    And I click on Signin
    And I sign in with invalid email address
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up

  @legacy @29.08
  Scenario: Password field data should get cleared when user signs in with invalid email address (checkout gift voucher)(via favourites)
    When I click on Favourite
    When I click on Favourite SignIn
    And I sign in with invalid email address
    Then I should see error message Sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up