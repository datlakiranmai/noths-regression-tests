Feature: Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
#    Given I enable the cognito flag ON as admin
#    And I navigate to home page
#    And I check my cognito flag is ON
    And I register as a new user

  @error_msg_check @cog_e2e @41.01
  Scenario: [New user] 41.01 - Sign out on my details page via the header
    When I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.02
  Scenario: [New user] 41.02 - Sign out on my details page via side menu
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.03
  Scenario: [New user] 41.03 - Sign out on product details page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I close survey pop up if any
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.04
  Scenario: [New user] 41.04 - Sign out on home page via the header
    And I navigate to home page
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.05
  Scenario: [New user] 41.05 - Sign out on favourites page via the header
    And I navigate to home page
    And I click on Favourite
    Then I am redirected to the My Favourites page
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.06
  Scenario: [New user] 41.06 - Sign out on order completion page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide MasterCard5X payment details
    Then I should see order confirmation page
    And I close mention me popup
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.07
  Scenario: [New user] 41.07 - Sign out the cart page via the header
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket and do not want to checkout
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.08
  Scenario: [New user] 41.08 - Sign out on a Home category page via the header
    When I navigate to a product listings page home/
    Then I should see my page title as home
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.09
  Scenario: [New user] 41.09 - Sign out on a Home > Home Accessories category page via the header
    When I navigate to a product listings page home/home-accessories/
    Then I should see my page title as home accessories
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.10
  Scenario: [New user] 41.10 - Sign out on a Home > Home Accessories > Art Pictures category page via the header
    When I navigate to a product listings page home/home-accessories/art-pictures
    Then I should see my page title as art & pictures
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.11
  Scenario: [New user] 41.11 - Sign out on the search results page via the header
    When I search for watches in search textfield
    And I click on Find
    Then I should be taken to search results
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @cog_e2e @41.12
  Scenario: [New user] 41.11 - Sign out on the gift voucher page via the header
    When I navigate to home page
    And I tap on the link gift vouchers in footer
    And I enter my details in gift voucher form
    And I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @rollback @41.13
  Scenario: [New user] 41.13 - Sign out when the flag is turned OFF
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out
