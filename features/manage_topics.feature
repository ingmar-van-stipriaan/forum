Feature: Manage Topics
  In order make a forum
  As a moderator
  I want to create and manage topics

  Scenario: Display a list of topics
    Given I have the topics titled Algemeen, Vragen, Huisregels
    When I visit the list of topics
    Then I should see "Algemeen"
    And I should see "Vragen"

  Scenario: Create a valid topic
    Given I have no topics
    And I am on de list of topics
    When I click on "Nieuwe Topic"
    And I fill in the "Title" with "Some title"
    And I click the button "Topic aanmaken"
    Then I should see "Topic is succesvol aangemaakt"
    And I should see "Some title"
    And I should have 1 topic