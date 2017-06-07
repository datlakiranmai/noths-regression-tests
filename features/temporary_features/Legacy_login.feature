Feature: Login

  As a customer
  I want to login to noths website for the first time via Cognito
  I expect to land on my details page

  Background:
    Given I am on Home page

  @temp @legacy @6.01
  Scenario:   Legacy Customer is able to successfully login to notonthehighstreet
    When I click on Signin
    And I verify sadhana.blueline995@gmail.com exist in noths database
    And I enter my login credentials:
      | user_name | sadhana.blueline995@gmail.com |
      | password  | Newlife2017                   |
    Then I should login successfully as Sad R
    And I should be taken to My details page
    And I should see the my email address in my accounts page