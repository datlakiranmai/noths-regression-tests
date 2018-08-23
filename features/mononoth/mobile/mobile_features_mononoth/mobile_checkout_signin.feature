Feature: Mobile signin temporary
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given the user_account flag is turn on
    And I register as a new user via mobile
    And I signout from my account

  @mobile_e2e_regression_tests @mobile @16.01
  Scenario: Customer should be able to purchase a product as a logged in user
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see Thank you for your order message


  @mobile @16.02
  Scenario: Customer should be able to purchase a product as a logged in user (via paypal Mark)
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I choose to pay via paypal
    Then I enter my paypal login credentials
    And I continue with the paypal checkout
    Then I should see Thank you for your order message

