Feature: Mobile Temporary Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I register as a new user via mobile

  @smoke_tests_mobile @mobile @19.01
  Scenario: Sign out
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons