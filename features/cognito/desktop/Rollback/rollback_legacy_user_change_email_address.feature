Feature: Update Email address [Rollback Legacy user]

  As a noths customer
  I should be able to update my email address via my details page
  I should be able to sign back in with my new email address

  Background:
    And I register as a new user
    And I sign out from my account

  @cog_e2e @173.01
  Scenario: [Rollback - Legacy user] 173.01 - A customer should be able to update their email address on the my details page
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I change my email address in my details page
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new email address
    And I expect NOT to see signin failure
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my new email address in my accounts page
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
