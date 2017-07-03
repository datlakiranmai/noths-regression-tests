Feature: Login_mobile
  As a customer
  I want to login to noths website for the first time
  I expect to land on my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user via mobile
    And I signout from my account
    
  @cog_mobile_e2e @68.01
  Scenario: Customer is able to successfully login to notonthehighstreet (standard product)
    When I navigate to my accounts
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see the my email address in my accounts page


  @cog_mobile_e2e @68.02
  Scenario: Customer is able to successfully login to notonthehighstreet (gift voucher)
    When I click on Favourite
    And I click on Favourite SignIn
    And I sign in with my new credentials
    And I navigate to my accounts
    And I click link to go to my details
    And I should be taken to My details page
    Then I should see the my email address in my accounts page