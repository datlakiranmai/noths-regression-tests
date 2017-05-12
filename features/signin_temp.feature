Feature: Temporary Login

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I am on Home page

  @temp @8.01
  Scenario:   Legacy Customer is able to successfully login to notonthehighstreet
    When I click on Signin
    And I enter my login credentials:
      | user_name | 1494597471@sharklasers.com |
      | password  | password                   |
    Then I should login successfully
    And I should be redirected to home page


  @temp @8.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    When I click on Favourite
    When I click on Signin
    And I enter my login credentials:
      | user_name | 1494597471@sharklasers.com |
      | password  | password                   |
    Then I should login successfully
    And I should be redirected to home page