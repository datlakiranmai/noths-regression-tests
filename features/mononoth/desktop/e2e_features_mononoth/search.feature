Feature: Search
  As a visitor
  I come across Noths Website
  I want to search for a product

  Background:
    Given I am on Home page

  @p1 @demo @P1 @e2e @30.01
  Scenario: 30.01 - Search for a particular product
    When I search for watches in search textfield
    And I click on Find
    Then I should be taken to search results
    And I should see my page title as You searched for "watches"
    And I should see the respective products

  @demo @P1 @e2e @30.02
  Scenario: 30.02 - Search products details
    When I search for red flowers in search textfield
    And I click on Find
    Then I should be taken to search results
    And I should see my page title as You searched for "red flowers"
    Then I should see images for all the products
    And I should see product title for all the products
    And I should see price tags for all the products

  @p1 @P1 @e2e @30.03
  Scenario: 30.03 - Filter out products which offers Free delivery
    When I search for plants in search textfield
    And I click on Find
    Then I should be taken to search results
    And I should see my page title as You searched for "plants"
    And I should see the respective products
    When I filter free delivery to mainland UK delivery option
    Then I should see a label as Free delivery
    And I should see free delivery label under all the products