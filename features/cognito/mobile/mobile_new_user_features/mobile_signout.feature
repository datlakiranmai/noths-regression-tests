Feature: Mobile Temporary Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user via mobile

  @cog_mobile_e2e @49.01
  Scenario: Sign out
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons