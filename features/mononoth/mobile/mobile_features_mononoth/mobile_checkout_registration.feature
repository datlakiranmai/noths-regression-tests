Feature: Mobile Checkout_registration temporary
  As a customer
  I have added a product to my basket
  I want to signup during checkout process

  Background:
    Given the user_account flag is turn on
    And I am on Home page

  @mobile_e2e_regression_tests @mobile @15.01
  Scenario: Customer should be able to purchase a product as a registered user
    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
    And I add the product in my basket
    And I click on Continue
    And I enter in my details in your details form
    And I check the privacy policy
    And I Continue to next page
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see Thank you for your order message