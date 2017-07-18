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
  Scenario: 75.01 - Customer is able to successfully login to notonthehighstreet using capitalized email address
    When I navigate to home page
    And I click on Signin
    And I sign in with my user name in capital letters
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
