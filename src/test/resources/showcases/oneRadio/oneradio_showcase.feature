@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Verify all menus
  As a developer
  I want to be able to use all feature of OneRadio component
  So that I can understand system

  Scenario Outline:
    Given I open OneRadio showcase page
    When I <option1> option, in mode <mode>
    Then <option1> should be checked
    When I choose option <number>, in mode <mode>
    Then <option2> should be checked
    Examples:
      | mode       | option1 | number | option2  |
      | basic      | PS4     | 1      | Xbox One |
      | responsive | London  | 1      | Miami    |

  Scenario Outline:
    Given I open OneRadio showcase page
    When I use custom layout mode, I choose option by Text <text>
    Then <option> should be checked

    Examples:
      | text | option |
      | Red  | Red    |
