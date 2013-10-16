Feature: Add inventory items to system
  As the inventory manager
  I want to add an inventory item to a the system,
  so that I can track the team inventory.

  * I should be able to add the following information:
    - a description of the item
    - size
    - quantity
    - a label for unique identification
    - purchase date
  * I should be able to select an item type
  * I should be able to associate an item with a squad.
  * 'Contact Kit' items should not have a quantity over 1 - we want to track each one
    individually, because they are expensive

  Background:
    Given I am logged in as "jmontague" with password "james"

  Scenario: Add Contact Kit Item
    When I add an item
    And I set 'type' to 'contact kit'
    Then I should not be able to change the quantity

  Scenario: Add item with quantity
    When I add an item
    And I set 'type' to 'training equipment'
    And I set 'quantity' to '2'
    Then I should see an item with 'quanity' equal to '2'

  Scenario: Add item to squad
    When I add an item
    And I set 'description' to 'flags'
    And I set 'quantity' to '20'
    And I set 'squad' to 'Junior Flag'
    Then I should see an item with 'squad' equal to 'junior flag'
