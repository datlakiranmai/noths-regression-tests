Feature: Login (username in uppercase)
  As a customer
  I want to login to noths website with my username in capital letters
  I expect to land on my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new Cognito user
    And I sign out from my account

  @smoke_tests @cog_e2e @no_poltergeist @75.01
  Scenario: Customer is able to successfully login to notonthehighstreet
    When I navigate to home page
    Then I should see user created in cognito
    And I should see user created in user table
    And I should see user password in user table is empty
    And I should see user created in cognito account table
    And I click on Signin
    And I sign in with my user name in capital letters
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I enter in my email in small cases in sign up form