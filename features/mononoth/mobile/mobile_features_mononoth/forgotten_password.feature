Feature: Forgotten password
  As a NOTHS customer
  I forgot my password
  I should be able to make email request for password reset via forgotten password form

  Background:
    Given I am on Home page

  @mobile @21.01
  Scenario: Customer requests password reset for a valid email address
    When I navigate to my accounts
    And I click on Signin
    And I click on Forgotten password
    And I provide my valid email address
    And I submit my forgotten password form
    Then I should be redirected with the message Your request has been submitted and you should receive an email from us shortly with instructions on how to reset your password. If you don't receive an email soon, please try again.

  @mobile @21.02
  Scenario: Customer requests password reset for an empty email address
    When I navigate to my accounts
    And I click on Signin
    And I click on Forgotten password
    And I provide my Invalid email address
    And I submit my forgotten password form
    Then I should see email validation error as Please enter your email.

  @mobile @21.03
  Scenario: Noths employee requests to reset password
    When I navigate to my accounts
    And I click on Signin
    And I click on Forgotten password
    And I provide my noths email address
    And I submit my forgotten password form
    Then I should see security error message saying Unfortunately due to security concerns, we cannot allow staff to reset their passwords. Please talk to a member of the IT team to reset your password.
