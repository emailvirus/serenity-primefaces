@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Login
  As a System manager
  I want to be able to login system by role System manager
  So I can use system

  Background:
    Given I logout from system

  Scenario Outline: login with role staff of branch
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Company Management | Common        |
      | Summary Report     | Report        |
      | Register           | Daily Report  |
      | Search History     | Daily Report  |
      | Search By Date     | Daily Report  |
      | Program Test       | Import/Export |
      | Integration Test   | Import/Export |

    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009911  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role staff of headquarter
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Company Management  | Common        |
      | Summary Report      | Report        |
      | Register            | Daily Report  |
      | Search History      | Daily Report  |
      | Search By Date      | Daily Report  |
      | Employee Management | Common        |
      | Program Test        | Import/Export |
      | Integration Test    | Import/Export |
    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009910  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role manager of branch
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Company Management   | Common        |
      | Summary Report       | Report        |
      | Register             | Daily Report  |
      | Search History       | Daily Report  |
      | Search By Date       | Daily Report  |
      | Notification Setting | Notification  |
      | View Notifications   | Notification  |
      | Program Test         | Import/Export |
      | Integration Test     | Import/Export |

    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009909  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role manager of headquarter
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Credit Management    | Accounting    |
      | Maintain Credit Data | Accounting    |
      | Company Management   | Common        |
      | Summary Report       | Report        |
      | Register             | Daily Report  |
      | Search History       | Daily Report  |
      | Search By Date       | Daily Report  |
      | Employee Management  | Common        |
      | Notification Setting | Notification  |
      | View Notifications   | Notification  |
      | BASS Export          | Import/Export |
      | SANSAN Import        | Import/Export |
      | Program Test         | Import/Export |
      | Integration Test     | Import/Export |

    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009908  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role system support of branch
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Company Management | Common        |
      | Summary Report     | Report        |
      | Register           | Daily Report  |
      | Search History     | Daily Report  |
      | Search By Date     | Daily Report  |
      | Program Test       | Import/Export |
      | Integration Test   | Import/Export |
    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009907  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role system support of headquarter
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Credit Management    | Accounting    |
      | Maintain Credit Data | Accounting    |
      | SANSAN Import        | Import/Export |
      | BASS Export          | Import/Export |
      | Company Management   | Common        |
      | Summary Report       | Report        |
      | Register             | Daily Report  |
      | Search History       | Daily Report  |
      | Search By Date       | Daily Report  |
      | Employee Management  | Common        |
      | Program Test         | Import/Export |
      | Integration Test     | Import/Export |
    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009906  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role officer of branch
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Company Management | Common        |
      | Summary Report     | Report        |
      | Register           | Daily Report  |
      | Search History     | Daily Report  |
      | Search By Date     | Daily Report  |
      | Program Test       | Import/Export |
      | Integration Test   | Import/Export |
    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009913  | 123456   | en   |

#--------------------------------------------------------------------------------

  Scenario Outline: login with role officer of headquarter
    Given I open Login page
    When I input my credentials username <username> and password <password>
    Then The system should let me in

    When I change language to <lang>
    Then The system should change all text to <lang>

    Given List menu I have permission
      | Credit Management  | Accounting    |
      | Company Management | Common        |
      | Summary Report     | Report        |
      | Register           | Daily Report  |
      | Search History     | Daily Report  |
      | Search By Date     | Daily Report  |
      | Program Test       | Import/Export |
      | Integration Test   | Import/Export |
    Then The system should show all menu I have permission
    And The system should show only menu I have permission

    Examples:
      | username | password | lang |
      | 4009912  | 123456   | en   |

#--------------------------------------------------------------------------------
