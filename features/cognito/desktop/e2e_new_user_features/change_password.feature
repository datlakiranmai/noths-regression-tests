Feature: Change Password [New user]

  As a noths customer
  I should be able to change password via my details page

  Background:
    Given I enable the cognito flag ON as admin
    And I navigate to home page
    And I check my cognito flag is ON
    And I register as a new user
    And I sign out from my account

  @cog_e2e @44.01
  Scenario: [New user] 44.01 - A customer should be able to reset their password on the my details page
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
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
    Then I should see my email address in my accounts page


  @cog_e2e @44.02
  Scenario: [New user] 44.02 - A customer should only provide a valid current password in the change password section and then attempt to sign in with the current password
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my existing credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page

  @cog_e2e @44.03
  Scenario: [New user] 44.03 - A customer should provide an invalid current password in change password section and attempt to sign in with the original current password
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide Invalid current password
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my existing credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    Then I should see my email address in my accounts page


  @cog_e2e @44.04
  Scenario: [New user] 44.04 - A customer should not be able to submit a password with an invalid length
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I provide a new password as qwert
    And I submit my details form
    Then I should get password length validation error saying The value entered is too short. Please enter a value that is at least 8 characters long.

  @cog_e2e @44.05
  Scenario: [New user] 44.05 - A customer should not be able to change their password if a new and confirm password do not match
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I provide a new password as qwertyuiop
    And I provide a confirm password as qwerty
    And I submit my details form
    Then I should get password mismatch validation error saying The values entered don't appear to match. Please check and try again.


  @cog_e2e @44.06
  Scenario: [New user] 44.06 - A customer should not be able to change their password if they do not supply confirm password value
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I provide a new password as qwertyuiop
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice


  @cog_e2e @44.07
  Scenario: [New user] 44.07 - A customer should provide an invalid current password, valid new password and confirm new password in change password section
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide Invalid current password
    And I provide a new password as qwertyuiop
    And I provide a confirm password as qwertyuiop
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying current password incorrect, please try again
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password as qwertyuiop
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up


  @cog_e2e @44.08
  Scenario: [New user] 44.08 - A customer should provide an blank current password, valid new password and confirm new password in change password section
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide a new password as qwertyuiop
    And I provide a confirm password as qwertyuiop
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying current password incorrect, please try again
    And I sign out from my account
    And I navigate to home page
    And I click on Signin
    And I sign in with my new password as qwertyuiop
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts
    And I should see sign in password textfield input should get cleared up


  @cog_e2e @44.09
  Scenario: [New user] 44.09 - A customer should provide an invalid current password, valid new password and blank confirm new password in change password section
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide Invalid current password
    And I provide a new password as qwertyuiop
    And I submit my details form
    Then I should get password error messages title saying Please check your details before continuing
    And I should get password error message saying Please enter the same password twice


#   TODO CONFIRM USER SPACES AS PASSWORDS
#  @smoke_tests @cog_e2e @44.07
#  Scenario: 44.07 - A customer should be able to chang
#    When I navigate to home page
#    And I click on Signin
#    And I sign in with my new credentials
#    And I navigate to My accounts page
#    And I choose my details from my account section
#    And I should be taken to My details page
#    And I should see the my email address in my accounts page
#    And I provide valid current password
#    And I provide a new password as password
#    And I submit my details form
#    Then I should get password error messages title saying Please check your details before continuing
#    And I should get password error message saying Please enter the same password twice
