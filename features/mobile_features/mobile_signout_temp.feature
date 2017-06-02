Feature: Mobile Temporary Sign out
  As a customer
  I want to sign out notonthehighstreet.com website

  Background:
    Given I am on Home page
    When I navigate to my accounts
    When I click on Signin
    And I enter my login credentials:
      | user_name | 1495542281@sharklasers.com |
      | password  | password                   |
    And I should be taken to My details page
    And I should see the my email address in my accounts page


  @mobile @mobile_demo @12.01
  Scenario: Sign out
    And I navigate to my accounts
    And I choose to signout
    Then I should see the message You have been signed out
    And I navigate to my accounts
    Then I should see sign in and register buttons