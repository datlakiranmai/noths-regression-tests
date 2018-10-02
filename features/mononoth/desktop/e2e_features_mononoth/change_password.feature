Feature: Change Password

  As a noths customer
  I should be able to change password via my details page

  Background:
    Given I navigate to home page
    And I check and enable the user_account flag
    And I register as a new user
    And I sign out from my account

  @p1 @e2e @e2e_staging @9.01
  Scenario: 9.01 - A customer should be able to reset their password on the my details page
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


  @smoke_tests @e2e @e2e_staging @9.02
  Scenario: 9.02 - A customer should only provide a valid current password in the change password section and then attempt to sign in with the current password
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


  @smoke_tests @e2e @e2e_staging @9.03
  Scenario: 9.03 - A customer should not be able to submit a password with an invalid length
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I provide a new password as qwerty
    And I submit my details form
    Then I should get password length validation error saying The value entered is too short. Please enter a value that is at least 8 characters long.

  @smoke_tests @e2e @e2e_staging @9.04
  Scenario: 9.04 - A customer should not be able to change their password if a new and confirm password do not match
    When I navigate to home page
    And I click on Signin
    And I sign in with my new credentials
    And I navigate to My accounts page
    And I choose my details from my account section
    And I should be taken to My details page
    And I should see my email address in my accounts page
    And I provide valid current password
    And I provide a new password as qwertyuiop
    And I provide a confirm password as qwertyuiopp
    And I submit my details form
    Then I should get password mismatch validation error saying The values entered don't appear to match. Please check and try again.


  @smoke_tests @e2e @e2e_staging @9.05
  Scenario: 9.05 - A customer should not be able to change their password if they do not supply confirm password value
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


  @smoke_tests @e2e @e2e_staging @9.06
  Scenario: 9.06 - A customer should provide an invalid current password, valid new password and confirm new password in change password section
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
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up


  @smoke_tests @e2e @e2e_staging @9.07
  Scenario: 9.07 - A customer should provide an blank current password, valid new password and confirm new password in change password section
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
    Then I should see error message sorry, either the email address or the password you entered does not correspond with any of our accounts.
    And I should see sign in password textfield input should get cleared up


  @smoke_tests @e2e @e2e_staging @9.08
  Scenario: 9.08 - A customer should provide an invalid current password, valid new password and blank confirm new password in change password section
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