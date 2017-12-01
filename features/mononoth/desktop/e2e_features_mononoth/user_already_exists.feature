Feature: User registration with an already existing email address
  As a customer
  I want to register to noths website
  with an already existing email address

  Background:
    Given I register as a new user
    And I sign out from my account

  @smoke_tests @e2e @7.01
  Scenario: 7.01 - A customer should see the 'user already exists' message if they use an existing registered email during the checkout of a standard product
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in existing details in your details form
    And I Continue to next page
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @smoke_tests @e2e @7.02
  Scenario: 7.02 - A customer should see the 'user already exists' message if they use an existing registered email during the gift voucher checkout
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I checkout gift voucher
    And I click on Continue
    And I enter in existing details in your details form
    And I Continue to next page
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @smoke_tests @e2e @7.03
  Scenario: 7.03 - A customer should see the 'user already exists' message if they use an existing registered email when registering via the header
    When I click on Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up

  @smoke_tests @e2e @7.04
  Scenario: 7.04 - A customer should see the 'user already exists' message if they use an existing registered email when registering via favourites
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my favourites
    When I click on active Favourite
    And I am redirected to the My Favourites page
    And I click on my favourites product image
    And I click on Favourite Register
    And I enter in my details in sign up form
    And I click Submit button
    Then I should see error title saying Please check your details before continuing
    And I should see error message saying this email address has already been used to register an account. to use this email address, simply sign in before continuing.
    And I should see info message saying To use this email address simply sign in before continuing.
    And I should see password text field input should get cleared up