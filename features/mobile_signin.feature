Feature: Login_mobile
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I am on Home page

  @11.01
  Scenario: Customer is able to successfully login to notonthehighstreet
    When I navigate to my accounts
    When I click on Signin
    And I enter my login credentials:
      | user_name | youhello@gmail.com |
      | password  | password                   |
    And I should be taken to My details page
    And I should see the my email address in my accounts page


  @11.02
  Scenario: Customer is able to successfully login to notonthehighstreet
    When I navigate to my accounts
    When I click on Signin
    And I enter my login credentials:
      | user_name | youhello@gmail.com |
      | password  | password                   |
    And I should be taken to My details page
    And I should see the my email address in my accounts page