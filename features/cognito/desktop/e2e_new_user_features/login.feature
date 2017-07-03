Feature: Login
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @cog_e2e @no_poltergeist @38.01
  Scenario: Customer is able to successfully login to notonthehighstreet
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    #Then I should login successfully
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @cog_e2e @no_poltergeist @38.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    When I click on Favourite
    When I click on Favourite SignIn
    And I sign in with my new credentials
    #Then I should login successfully
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page