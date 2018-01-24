Feature: Change default country code [Rollback New user]

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @cog_e2e @176.01
  Scenario: [Rollback New user] 176.01 - A potential customer is able to successfully register with a custom country code via the header
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I select my country code as Germany
    And I provide my contact number as 069 299 571 109
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Germany [49]
    And I should see my contact number as 069299571109
    And I sign out from my account
    And I navigate to home page
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Germany [49]
    And I should see my contact number as 069299571109
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Germany [49]
    And I should see my contact number as 069299571109


  @cog_e2e @176.02
  Scenario Outline: [Rollbcak New user] 176.02 - A potential customer is able to successfully register with a following British Isles via the header
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I select my country code as <isle>
    And I provide my contact number as 07 92 99 57 11 0
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as 07929957110
    And I sign out from my account
    And I navigate to home page
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as 07929957110
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as 07929957110
    Examples:
      | isle        |
      | Isle of Man |
      | Jersey      |
      | Guernsey    |

  @cog_e2e @176.03
  Scenario: [Rollback New user] 176.03 - A potential customer is able to successfully change their country and contact number in the my details page
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I select my country code as Isle of Man
    And I provide my contact number as 077 92 99 57 11
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as 07792995711
    And I select my country code as Isle of Man [44]
    And I provide my contact number as 07799995722
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Isle of Man [44]
    And I should see my contact number as 07799995722
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Isle of Man [44]
    And I should see my contact number as 07799995722


    #Extra validation is needed before a phone number is registered in cognito. This test reflects the current behaviour.
  @cog_e2e @176.04
  Scenario: [Rollback New user] 176.04 - A potential customer is able to successfully register with an Invalid phone number
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I provide my contact number as 077 92 99 57 11 12 13 14
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as +4407792995711121314
    And I choose sign out from my details section
    Then I should successfully sign out
    And I should see the message You have been signed out
    Given I enable the rollback flag ON as admin
    And I navigate to home page
    And I check my rollback flag is ON
    Given I enable the cognito flag OFF as admin
    And I navigate to home page
    And I check my cognito flag is OFF
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as United Kingdom [44]
    And I should see my contact number as +4407792995711121314
