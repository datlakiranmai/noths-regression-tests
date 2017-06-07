Feature: Login_mobile
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I am on Home page

  @mobile @mobile_demo @11.01
  Scenario: Customer is able to successfully login to notonthehighstreet (standard product)
    When I navigate to my accounts
    When I click on Signin
    And I enter my login credentials:
      | user_name | 1496669633@sharklasers.com |
      | password  | password           |
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see the my email address in my accounts page


  @mobile @mobile_demo @11.02
  Scenario: Customer is able to successfully login to notonthehighstreet (gift voucher)
    When I click on Favourite
    When I click on Favourites SignIn
    And I enter my login credentials:
      | user_name | 1496669633@sharklasers.com |
      | password  | password           |
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see the my email address in my accounts page