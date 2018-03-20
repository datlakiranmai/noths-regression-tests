Feature: Mobile Temporary Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user via mobile

  @smoke_tests_mobile @cog_mobile_e2e @69.01
  Scenario: Sign out
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons

  @smoke_tests_mobile @cog_mobile_e2e @69.02
  Scenario: [Mobile] 69.02 - Sign out on product details page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons

  @smoke_tests_mobile @cog_mobile_e2e @69.03
  Scenario: [Mobile] 69.03 - Sign out on home page via the header
    And I navigate to home page
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons

  @smoke_tests_mobile @cog_mobile_e2e @69.04
  Scenario: [Mobile] 69.04 - Sign out on favourites page via the header
    And I navigate to home page
    And I click on Favourite
    Then I should be in favourites page
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons

  @smoke_tests_mobile @cog_mobile_e2e @69.05
  Scenario: [Mobile] 69.05 - Sign out on order completion page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide Visa Debit or Electron payment details
    Then I should see order confirmation page
    And I close mention me popup
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out
