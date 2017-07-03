Feature: Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user

  @cog_e2e @41.01
  Scenario: Sign out via header
   When I hover my account via header
   And I click on Sign out
   Then I should successfully sign out
   And I should see the message You have been signed out

  @cog_e2e @41.02
  Scenario: Sign out via my details
    #When I navigate to My accounts page
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out