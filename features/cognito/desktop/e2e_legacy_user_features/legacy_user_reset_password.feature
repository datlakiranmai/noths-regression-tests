Feature: Leagacy user Reset Password

  As a noths customer
  I should be able to reset password via my details page

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @smoke_tests @legacy @30.01
  Scenario: Customer should be able to reset password in my details page
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I change my existing password in my details page
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see the my email address in my accounts page