Feature: Change default country code [Legacy user]

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  @cog_e2e @33.01
  Scenario: [Legacy user] 33.01 - A potential customer is able to successfully register with a custom country code via the header
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I select my country code as Finland
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Finland [358]
    And I sign out from my account
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I navigate to home page
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as Finland [358]


  @cog_e2e @33.02
  Scenario Outline: [Legacy user] 33.02 - A potential customer is able to successfully register with a following British Isles via the header
    Given I am on Home page
    And I click on Register
    And I enter in my details in sign up form
    And I select my country code as <isle>
    And I provide my contact number as 06 92 99 57 11 09
    And I click Submit button
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as <isle_with_code>
    And I should see my contact number as 06 92 99 57 11 09
    And I sign out from my account
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I navigate to home page
    When I click on Signin
    And I sign in with my new credentials
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I should see my country code as <isle_with_code>
    And I should see my contact number as 06 92 99 57 11 09
    Examples:
      | isle        | isle_with_code   |
      | Isle of Man | Isle of Man [44] |
      | Jersey      | Jersey [44]      |
      | Guernsey    | Guernsey [44]    |