Feature: Legacy Login

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I register as a new user
    And I sign out from my account
    And I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON

  @legacy @17.01
  Scenario:   Legacy Customer is able to successfully login to notonthehighstreet
    When I click on Signin
    And I sign in with my new credentials
    Then I should login successfully
    Then I navigate to My accounts page
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @legacy @17.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    When I click on Favourite
    When I click on Signin
    And I sign in with my new credentials
    Then I should login successfully
    And I should be taken to My details page
    And I should see the my email address in my accounts page