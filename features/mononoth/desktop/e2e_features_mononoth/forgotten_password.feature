Feature: Forgotten password
  As a NOTHS customer
  I forgot my password
  I should be able to make email request for password reset via forgotten password form

  Background:
    Given I navigate to home page
    And I check and enable the user_account flag
    And I am on Home page

  @p1 @e2e @8.01
  Scenario: 8.01 - A customer should request a reset password email
    And I register as a new user
    And I sign out from my account
    And I click on Signin
    And I click on Forgotten password
    And I provide my cognito email address
    And I submit my forgotten password form
    Then I should see Your request has been submitted and you should receive an email from us shortly with instructions on how to reset your password. If you don't receive an email soon, please try again.

  @e2e @8.02
  Scenario: 8.02 - A customer should not be able to request a reset password email without an email address
    And I click on Signin
    And I click on Forgotten password
    And I provide my Invalid email address
    And I submit my forgotten password form
    Then I should see email validation error as Please enter your email.

  @e2e @8.03
  Scenario: 8.03 - A Noths employee should not be able to request a reset password email
    And I click on Signin
    And I click on Forgotten password
    And I provide my noths email address
    And I submit my forgotten password form
    Then I should see security error message saying Unfortunately due to security concerns, we cannot allow staff to reset their passwords. Please talk to a member of the IT team to reset your password.