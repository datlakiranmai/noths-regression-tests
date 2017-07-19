Feature: Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I register as a new user

  @smoke_tests @e2e @4.01
  Scenario: 4.01 - Sign out via the header
   When I hover my account via header
   And I click on Sign out
   Then I should successfully sign out
   And I should see the message You have been signed out

  @smoke_tests @e2e @4.02
  Scenario: 4.02 - Sign out via my details page
    When I navigate to My accounts page
    And I choose my details from my details section
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out