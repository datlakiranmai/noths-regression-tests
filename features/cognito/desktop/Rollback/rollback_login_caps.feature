Feature: Login (username in uppercase) [Rollback New user]
  As a customer
  I want to login to noths website with my username in capital letters
  I expect to land on my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new Cognito user
    And I sign out from my account

  @cog_e2e @no_poltergeist @185.01
  Scenario: [Rollback New user] 179.01 - A customer should be able to successfully login via the header using a capitalized email address
    When I navigate to home page
    And I click on Signin
    And I sign in with my user name in capital letters
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I navigate to home page
    And I click on Signin
    And I sign in with my user name in capital letters
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page


  @cog_e2e @no_poltergeist @185.02
  Scenario: [Rollback New user] 179.02 - A customer should be able to successfully login during the checkout flow using a capitalized email address
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my user name in capital letters
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
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
    And I sign in with my user name in capital letters
    #And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide the payment details
    Then I should see order confirmation page