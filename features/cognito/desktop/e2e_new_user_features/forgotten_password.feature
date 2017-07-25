Feature: Forgotten password [New User]
  As a NOTHS customer
  I forgot my password
  I should be able to make email request for password reset via forgotten password form

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I am on Home page

  @43.01
  Scenario: [New user] 43.02 - A customer should request a reset password email
    And I register as a new user
    And I sign out from my account
    And I click on Signin
    And I click on Forgotten password
    And I provide my cognito email address
    And I submit my forgotten password form
    Then I should see Your request has been submitted and you should receive an email from us shortly with instructions on how to reset your password. If you don't receive an email soon, please try again.

  @43.02
  Scenario: [New user] 43.03 - A customer should not be able to request a reset password email without an email address
    And I click on Signin
    And I click on Forgotten password
    And I provide my empty email address
    And I submit my forgotten password form
    Then I should see email validation error as Please enter your email.

  @43.03
  Scenario: [New user] 43.04 -  A Noths employee should not be able to request a reset password email
    And I click on Signin
    And I click on Forgotten password
    And I provide my noths email address
    And I submit my forgotten password form
    Then I should see security error message saying Unfortunately due to security concerns, we cannot allow staff to reset their passwords. Please talk to a member of the IT team to reset your password.