Feature: Update Email address

  As a noths customer
  I should be able to update my email address via my details page

  Background:
    Given I navigate to home page
    And I check and enable the user_account flag
    And I register as a new user
    And I sign out from my account

  @p1 @e2e @e2e_staging @12.01
  Scenario: [New user] 46.01 - A customer should be able to update their email address on the my details page
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
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