Feature: Checkout Login
  As a customer
  I have added a product to my basket
  I want to signin during checkout process

  Background:
    Given I navigate to home page
    And I check and enable the user_account flag
    And I register as a new user
    And I sign out from my account

  @p1 @payments @e2e @e2e_staging @3.01
  Scenario: 3.01 - Checkout E2E - Customer should be able to purchase a product as a customer( Visa Debit or Electron)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide VisaDebit payment details
    Then I should see order confirmation page

  @payments @e2e @3.02
  Scenario: 3.02 - Checkout E2E - Customer should be able to purchase a product as a customer (MasterCard 5XX Card number)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide MasterCard5X payment details
    Then I should see order confirmation page

  @payments @e2e @3.03
  Scenario: 3.03 - Checkout E2E - Customer should be able to purchase a product as a customer (Visa)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide Visa payment details
    Then I should see order confirmation page

  @payments @e2e @3.04
  Scenario: 3.04 - Checkout E2E - Customer should be able to purchase a product as a customer (American Express)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide AmericanExpress payment details
    Then I should see order confirmation page


  @payments @paypal @e2e @e2e_staging @3.05
  Scenario: 3.05 - Checkout E2E - Customer should be able to purchase a product as a customer (paypal Mark)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
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
    Then I should see order confirmation page

#  @smoke_tests @e2e @3.06
#  Scenario: 3.06 - Checkout E2E - A customer should be able to checkout a product using the gift card and card payment together
#    When I navigate to a product detail page /marquisanddawe/product/charcoal-felt-stool-tray
#    And I add the product in my basket
#    And I sign in with my new credentials
#    And I enter in my address details
#    Then I should see my name as delivery recipient
#    And  I should see Antony Roberts Estate Agents as my delivery address
#    And I should see the my email address in summary section
#    When I continue with my delivery address
#    And I click on voucher code link
#    And I apply my gift voucher code
#    And I provide VisaDebit payment details
#    Then I should see order confirmation page

#  @smoke_tests @e2e @3.07
#  Scenario: 3.07 - Checkout E2E - A customer should be able to checkout a product using the gift card
#    When I navigate to a product detail page /willbishopjewellerydesign/product/bumble-bee-brooch
#    And I add the product in my basket
#    And I sign in with my new credentials
#    And I enter in my address details
#    Then I should see my name as delivery recipient
#    And  I should see Antony Roberts Estate Agents as my delivery address
#    And I should see the my email address in summary section
#    When I continue with my delivery address
#    And I click on voucher code link
#    And I apply my gift voucher code
#    Then I should see order confirmation page


  @payments @e2e @e2e_staging @3.08
  Scenario: 3.08 - Checkout E2E - Customer should be able to purchase a product as a customer (MasterCard 2XX Card Number)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide MasterCard2X payment details
    Then I should see order confirmation page

  @test @payments @e2e @3.09
  Scenario: 3.09 - Checkout E2E - Customer should be able to purchase a product as a customer (3D Secure Gift Card flow)
    When I navigate to a product detail page marquisanddawe/product/tallulah-gold-distressed-table
    And I add the product in my basket
    And I sign in with my new credentials
    And I enter in my address details
    Then I should see my name as delivery recipient
    And  I should see Antony Roberts Estate Agents as my delivery address
    And I should see the my email address in summary section
    When I continue with my delivery address
    And I specify my card type
    And I provide 3DSecure payment details
    And I provide my credentials
    Then I should see order confirmation page