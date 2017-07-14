Feature: Change Password

  As a noths customer
  I should be able to change password via my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @smoke_tests @cog_e2e @44.01
  Scenario: Customer should be able to reset password in my details page
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I change my existing password in my details page
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see the my email address in my accounts page


  @smoke_tests @cog_e2e @44.02
  Scenario: Customer provides only valid current password in change password form and attempt to sign in with current password
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide valid current password
    And I submit my details form
    Then I should see flash message saying your details have successfully been updated
    And I sign out from my account
    And I click on Signin
    And I sign in with my existing credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see the my email address in my accounts page


  @smoke_tests @cog_e2e @44.03
  Scenario: Customer provides Invalid current password in change password form and attempt to sign in with current password
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide Invalid current password
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying current password incorrect, please try again
    And I sign out from my account
    And I click on Signin
    And I sign in with new current password
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up

  @smoke_tests @cog_e2e @44.04
  Scenario: Customer provides short new password in change password form and attempt to submit the form
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide valid current password
    And I provide a new password as passwd
    And I submit my details form
    Then I should get password length validation error saying The value entered is too short. Please enter a value that is at least 8 characters long.

  @smoke_tests @cog_e2e @44.05
  Scenario: Customer provides valid new password and mismatched confirm password in change password form and attempt to submit the form
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide valid current password
    And I provide a new password as password
    And I provide a confirm password as passwordd
    And I submit my details form
    Then I should get password mismatch validation error saying The values entered don't appear to match. Please check and try again.


  @smoke_tests @cog_e2e @44.06
  Scenario: Customer provides valid current passoword and new password, but do not provide input in confire new password field
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide valid current password
    And I provide a new password as password
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice


  @smoke_tests @cog_e2e @44.07
  Scenario: Customer provides valid current passoword and new password, but do not provide input in confirm new password field
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see the my email address in my accounts page
    And I provide valid current password
    And I provide a new password as password
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice
