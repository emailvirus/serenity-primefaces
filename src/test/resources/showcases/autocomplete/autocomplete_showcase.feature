@version:6.0.RC4
@version:Sprint-1.1
@issue:
Feature: Test all showcases of Autocomplete component
  As an developer
  I want to be able to run simplified feature
  So that I can debug quickly

  Scenario Outline: Input 12 and got the suggestion results
    Given  I open Autocomplete showcase Page
    When  I input <text> into autocomplete of mode <mode>
    Then system show me <numberOfItems> items as result

    Examples:
      | text | mode      | numberOfItems |
      | 12   | simple    | 10            |
      | 12   | minlength | 0             |
      | 123  | minlength | 10            |
      |      | dropdown  | 10            |

  Scenario Outline:
    Given I open Autocomplete showcase Page
    When  I type a part of theme name <a_part_of_name>, then choose <name> from result list
    Then The theme <name> must be selected
    Examples:
      | a_part_of_name | name      |
      | af             | Afterdark |