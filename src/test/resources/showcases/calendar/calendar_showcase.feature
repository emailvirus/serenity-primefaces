@version:6.0.RC4
@version:Sprint-1.1
@issue:
Feature: Test all showcases of Calendar component
  As an developer
  I want to be able to run simplified feature
  So that I can debug quickly

  Scenario Outline: Select a date by click Button
    Given  I open Calendar showcase Page
    When  I open calendar in mode <mode>, and locale <locale>, select June of 2016, and click 2 day
    Then The 02/06/2016 element must be selected

    Examples:
      | mode   | locale  |
      | inline | english |
      | button | english |
      | popup  | english |