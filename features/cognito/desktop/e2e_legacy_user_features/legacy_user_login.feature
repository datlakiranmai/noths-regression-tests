Feature: Legacy user login via header

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @legacy @27.01
  Scenario:   Legacy Customer is able to successfully login to notonthehighstreet
    And I should see user created in user table
    And I should see user password in user table is not empty
    When I click on Signin
    And I sign in with my new credentials
    #Then I should login successfully
    Then I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in cognito account table

  @legacy @27.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    And I should see user created in user table
    And I should see user password in user table is not empty
    When I click on Favourite
    When I click on Signin
    And I sign in with my new credentials
    #Then I should login successfully
    When I navigate to My accounts page
    And I choose my details from my account section
    Then I should be taken to My details page
    And I should see the my email address in my accounts page
    Then I should see user created in cognito
    And I should see user created in cognito account table