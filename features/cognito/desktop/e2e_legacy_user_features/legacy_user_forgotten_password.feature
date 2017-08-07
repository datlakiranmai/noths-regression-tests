Feature: Forgotten password [Legacy user]

  As a NOTHS customer
  I forgot my password
  I should be able to make email request for password reset via forgotten password form

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @cog_e2e @31.01
  Scenario: [Legacy user] 31.01 - A legacy customer should request a reset password email
    And I click on Signin
    And I click on Forgotten password
    And I provide my legacy email address
    And I submit my forgotten password form
    Then I should be redirected with the message Your request has been submitted and you should receive an email from us shortly with instructions on how to reset your password. If you don't receive an email soon, please try again.