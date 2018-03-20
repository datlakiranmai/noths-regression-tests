Feature: Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I register as a new user

   @e2e @4.01
  Scenario:4.01 - Sign out via the header
   When I hover my account via header
   And I click on Sign out
   Then I should successfully sign out
   And I should see the message You have been signed out

  @e2e @4.02
  Scenario:4.02 - Sign out via my details page
    When I navigate to My accounts page
    And I choose my details from my details section
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.03
  Scenario:4.03 - Sign out on product details page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.04
  Scenario:4.04 - Sign out on home page via the header
    And I navigate to home page
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.05
  Scenario:4.05 - Sign out on favourites page via the header
    And I navigate to home page
    And I click on Favourite
    Then I am redirected to the My Favourites page
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.06
  Scenario:4.06 - Sign out on order completion page via the header
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

  @e2e @4.07
  Scenario: 4.07 - Sign out the cart page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket and do not want to checkout
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.08
  Scenario: 4.08 - Sign out on a Home category page via the header
    When I navigate to a product listings page home/
    Then I should see my page title as home
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.09
  Scenario: 4.09 - Sign out on a Home > Home Accessories category page via the header
    When I navigate to a product listings page home/home-accessories/
    Then I should see my page title as home accessories
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.10
  Scenario: 4.10 - Sign out on a Home > Home Accessories > Art Pictures category page via the header
    When I navigate to a product listings page home/home-accessories/art-pictures
    Then I should see my page title as art & pictures
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.11
  Scenario: 4.11 - Sign out on the search results page via the header
    When I search for watches in search textfield
    And I click on Find
    Then I should be taken to search results
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @e2e @4.12
  Scenario: 4.12 - Sign out on the gift voucher page via the header
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out