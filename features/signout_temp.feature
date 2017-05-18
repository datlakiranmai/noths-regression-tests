Feature: Temporary Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I am on Home page
    When I click on Signin
    And I enter my login credentials:
      | user_name | 1494941299@sharklasers.com |
      | password  | password                   |
    Then I should login successfully

  @temp @9.01
  Scenario: Sign out via header
    When I hover my account via header
    And I click on Sign out
    Then I should successfully sign out
    And I should see the message You have been signed out

  @temp @9.02
  Scenario: Sign out via my details
    When I navigate to My accounts page
    And I choose sign out from my account section
    Then I should successfully sign out
    And I should see the message You have been signed out