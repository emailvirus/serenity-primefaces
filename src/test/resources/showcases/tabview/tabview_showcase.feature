@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Test all tabview feature
  As an user
  I want to be select tab by name or index
  So that I can change view

  Scenario Outline:
    Given I open Tabview showcase Page
    When  I click tab at index <tabIndex> in mode <mode>
    Then The tab <tabName> must be active
    When I click tab name <tabName2>
    Then The tab <tabName2> must be active
    Examples:
      | tabIndex | tabName           | tabName2           | mode  |
      | 1        | Godfather Part II | Godfather Part III | basic |
      | 1        | Godfather Part II | Godfather Part III | lazy  |