@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Search Daily report by date
  As a user
  I want search daily report by date
  So I can view detail, delete or edit daily report

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: initialization screen
    When I open submenu <submenuText> of menu <menuText>
    Then The system should show initialization screen of Search by Date page

    Examples:
      | submenuText    | menuText     |
      | Search By Date | Daily Report |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: search daily report
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I click button '<buttonText>'
    Then The system should show required branch and employee error message

    When In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonText>'
    Then The system should show table Search by date result with no record found

    When In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I click button '<buttonText>'
    Then The system should show table Search by date result has record found
    And The system should show button Edit and Delete disabled

    When In Search by date screen, I click checkbox Include retired employee
    And In Search by date screen, I click button '<buttonText>'
    Then The system should show required employee error message

    When In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonText>'
    Then The system should show table Search by date result has record found

    Examples:
      | submenuText    | menuText     | buttonText | branchName | employeeInfo | date       |
      | Search By Date | Daily Report | Search     | 福岡県        | 40000005     | 2012/11/28 |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: toggle
    Given A list of column title need toggle in Search by date
      | Reminder start time |
      | Reminder end time   |
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonText>'
    And I open toggle menu in table Search by date result
    And I toggle all column in table Search by date result
    Then The system should show table Search by date result has <totalColumn> columns

    Examples:
      | submenuText    | menuText     | totalColumn | buttonText | branchName | employeeInfo | date       |
      | Search By Date | Daily Report | 9           | Search     | 福岡県        | 40000005     | 2012/11/28 |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: paging
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonText>'
    And In Search by date screen, I click button last page on paging
    Then The table Search by date result should show last page

    When In Search by date screen, I click button first page on paging
    Then The table Search by date result should show first page

    When In Search by date screen, I click page <pageNumberOne> on paging
    Then The table Search by date result should change to selected page <pageNumberOne>

    When In Search by date screen, I click button back on paging
    Then The table Search by date result should change to selected page <pageNumberOne> - 1

    When In Search by date screen, I click button next on paging
    Then The table Search by date result should change to selected page <pageNumberOne>

    Examples:
      | submenuText    | menuText     | buttonText | branchName | employeeInfo | date       | pageNumberOne |
      | Search By Date | Daily Report | Search     | 福岡県        | 40000005     | 2012/11/28 | 2             |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: show all business detail
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonSearchText>'

    When In Search by date screen, I click button '<buttonShowAllText>'
    Then The table Search by date result should expand all row

    Examples:
      | submenuText    | menuText     | buttonSearchText | branchName | employeeInfo | date       | buttonShowAllText        |
      | Search By Date | Daily Report | Search           | 福岡県        | 40000005     | 2012/11/28 | Show all Business Detail |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: verify edit daily report
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonSearchText>'
    And In Search by date screen, I select row <rowIndex>
    And In Search by date screen, I click button '<editButtonText>'
    Then The system should open '<pageTitle>' page

    Examples:
      | submenuText    | menuText     | buttonSearchText | branchName | employeeInfo | date       | editButtonText | rowIndex | pageTitle    |
      | Search By Date | Daily Report | Search           | 北海道        | 濱谷賢児     | 2010/09/14 | Edit           | 0        | Daily Report |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: verify delete daily report with user is manager
    When I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonSearchText>'
    And In Search by date screen, I select row <rowIndex>
    And In Search by date screen, I click button '<deleteButtonText>'
    Then The system should show confirm delete popup

    When In Search by date screen, I click button '<noButtonText>' in confirm delete popup
    Then The system should show table Search by date result has record found

    When In Search by date screen, I click button '<deleteButtonText>'
    And In Search by date screen, I click button '<yesButtonText>' in confirm delete popup
    Then The system should show message delete successfully

    Examples:
      | submenuText    | menuText     | buttonSearchText | branchName | employeeInfo | date       | deleteButtonText | rowIndex | noButtonText | yesButtonText |
      | Search By Date | Daily Report | Search           | 北海道        | 濱谷賢児         | 2010/09/14 | Delete           | 0        | No           | Yes           |

#-------------------------------------------------------------------------------#

  Scenario Outline: verify delete daily report with user isn't manager
    When I open Login page
    And I input my credentials username <username> and password <password>
    And I change language to <lang>
    And I open submenu <submenuText> of menu <menuText>
    And In Search by date screen, I select date <date> in item Date
    And In Search by date screen, I choose a branch <branchName> in dropdown Branch
    And In Search by date screen, I type value <employeeInfo> for autocomplete Employee
    And In Search by date screen, I choose <employeeInfo> employee in dropdown of autocomplete Employee
    And In Search by date screen, I click button '<buttonSearchText>'
    Then The system should show table Search by date result can not select any row

    Examples:
      | username | password | lang | submenuText    | menuText     | buttonSearchText | branchName | employeeInfo | date       |
      | 22000002 | 123456   | en   | Search By Date | Daily Report | Search           | 北海道        | 濱谷賢児         | 2010/09/14 |

#-------------------------------------------------------------------------------#

