Feature: Login (username in uppercase) [Legacy User]
  As a customer
  I want to login to noths website with my username in capital letters
  I expect to land on my details page

  Background:
    Given I register as a new Cognito user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @cog_e2e @32.01
  Scenario: [Legacy user] 32.01 - A customer should be able to successfully login via the header using a capitalized email address
    When I navigate to home page
    And I click on Signin
    And I sign in with my user name in capital letters
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page

  @cog_e2e  @32.02
  Scenario: [Legacy user] 32.02 - A customer should be able to successfully login during the checkout flow using a capitalized email address
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
