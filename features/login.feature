Feature: Login
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I register as a new user
    And I sign out from my account

  @2.01
  Scenario: Customer is able to successfully login to notonthehighstreet
    When I click on Signin
    And I sign in with my new credentials
    Then I should login successfully
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @2.02
  Scenario: Customer is able to successfully login to notonthehighstreet via favourites
    When I click on Favourite
    When I click on Signin
    And I sign in with my new credentials
    Then I should login successfully
    And I should be taken to My details page
    And I should see the my email address in my accounts page

  @2.03
  Scenario: Customer is able to successfully login to notonthehighstreet via wishlist
    When I tap on the link wish lists in footer
    And I go for sign in from wishlist page
    And I sign in with my new credentials
    Then I should login successfully

