Feature: Forgotten password
  As a NOTHS customer
  I forgot my password
  I should be able to make email request for password reset via forgotten password form

  Background:
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    Given I am on Home page

  @cog_mobile_e2e @71.01
  Scenario: Customer requests password reset for a valid email address
    When I navigate to my accounts
    And I click on Signin
    And I click on Forgotten password
    And I provide my valid email address
    And I submit my forgotten password form
    Then I should see Your request has been submitted and you should receive an email from us shortly with instructions on how to reset your password. If you don't receive an email soon, please try again.

  @cog_mobile_e2e @71.02
  Scenario: Customer requests password reset for an empty email address
    When I navigate to my accounts
    And I click on Signin
    And I click on Forgotten password
    And I provide my Invalid email address
    And I submit my forgotten password form
    Then I should see email validation error as Please enter your email.
