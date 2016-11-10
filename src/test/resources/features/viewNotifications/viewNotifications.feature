@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: View Notification
  As a user
  I want to check my notification
  So I can view detail, delete or change setting of notification

#-------------------------------------------------------------------------------#

#  @LoggedIn
  Scenario Outline: initialization screen when have no data
    When I open Login page
    And I input my credentials username <username> and password <password>
    And I change language to <lang>
    When I open submenu <submenuText> of menu <menuText>
    Then The system should open '<menuText>' page
    And The system should show initialization screen of View Notifications page

    Examples:
      | username | password | lang | submenuText        | menuText     |
      | 12000001 | 123456   | en   | View Notifications | Notification |

  Scenario: logout from system
    Given I logout from system

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: create new daily report and logout from system
    When I open submenu <notificationSettingMenuText> of menu <notificationMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName |
      |             |               | All employee |
    And In Notification Setting screen, I click in <addBtn>
    Then I open submenu <viewNotificationsMenuText> of menu <notificationMenuText>

    When I logout from system
    When I open Login page
    And I input my credentials username <staffUsername> and password <staffPassword>
    And I change language to <lang>
    And I open submenu <submenuText> of menu <menuText>
    And I add new Daily report with data below
      | companyName | content                            |
      | CIJ         | Content for test view notification |
    Then The system should show message add new daily report successfully

    Examples:
      | staffUsername | staffPassword | lang | submenuText | menuText     | viewNotificationsMenuText | notificationSettingMenuText | notificationMenuText | addBtn |
      | 22000002      | 123456        | en   | Register    | Daily Report | View Notifications        | Notification Setting        | Notification         | Add    |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: initialization screen when have data
    When I open submenu <submenuText> of menu <menuText>
    Then The system should open '<menuText>' page
    And The system should show initialization screen of View Notifications page when have data

    Examples:
      | submenuText        | menuText     |
      | View Notifications | Notification |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: switch to notification setting page
    When I open submenu <submenuText> of menu <menuText>
    And In View notification screen, I click button '<buttonText>'
    Then The system should switch to Notification setting screen

    Examples:
      | submenuText        | menuText     | buttonText           |
      | View Notifications | Notification | Notification Setting |

#-------------------------------------------------------------------------------#

  Scenario Outline: create new daily report and logout from system
    When I open Login page
    And I input my credentials username <staffUsername> and password <staffPassword>
    And I change language to <lang>
    And I open submenu <submenuText> of menu <menuText>
    And I add new Daily report with data below
      | companyName | content            |
      | CIJ         | First daily report |
    Then The system should show message add new daily report successfully

    When I add new Daily report with data below
      | companyName | content             |
      | CIJ         | Second daily report |
    Then The system should show message add new daily report successfully

    When I logout from system

    Examples:
      | staffUsername | staffPassword | lang | submenuText | menuText     |
      | 22000002      | 123456        | en   | Register    | Daily Report |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: view details notification
    When I open submenu <submenuText> of menu <menuText>
    And In View notification screen, I choose row <rowIndex> in table list notification
    Then The system should show list table notification detail

    When In View notification screen, I choose row <rowIndex> in table <tableIndex> of Notification details panel
    Then The system should open '<dailyReportTitle>' page

    When I close screen
    Then The system should show initialization screen of View Notifications page when have data

    Examples:
      | submenuText        | menuText     | rowIndex | tableIndex | dailyReportTitle |
      | View Notifications | Notification | 0        | 0          | Daily Report     |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: verify mark all as read function
    When I open submenu <submenuText> of menu <menuText>
    And In View notification screen, I click button '<markAllAsReadButtonTitle>'
    And In View notification screen, I click button '<buttonNoTile>' in  confirm dialog
    Then The system should show initialization screen of View Notifications page when have data

    When In View notification screen, I click button '<markAllAsReadButtonTitle>'
    And In View notification screen, I click button '<buttonYesTile>' in  confirm dialog
    Then The system should show message mark all successfully

    Examples:
      | submenuText        | menuText     | markAllAsReadButtonTitle | buttonNoTile | buttonYesTile |
      | View Notifications | Notification | Mark all as read         | No           | Yes           |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: verify when delete tracking a user then add tracking that user again
    When I open submenu <notificationSettingMenuText> of menu <notificationMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName |
      |             |               | All employee |
    And In Notification Setting screen, I click in <addBtn>
    And In Notification Setting screen, I click in <viewNotification>

    When I logout from system
    When I open Login page
    And I input my credentials username <staffUsername> and password <staffPassword>
    And I change language to <lang>
    And I open submenu <registerMenuText> of menu <dailyReportMenuText>
    And I add new Daily report with data below
      | companyName | content |
      | CIJ         | content |
    Then The system should show message add new daily report successfully

    When I logout from system
    And I input my credentials username <managerUsername> and password <managerPassword>
    And I change language to <lang>
    And I open submenu <viewNotificationsMenuText> of menu <notificationMenuText>
    Then The system should show initialization screen of View Notifications page when have data

    When In View notification screen, I click button '<notificationSettingText>'
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName |
      | 大阪府         | All position  | 岡本力          |
    And In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, System show message <successSave>

    When In Notification Setting screen, I click in <viewNotification>
    Then The system should show initialization screen of View Notifications page

    Examples:
      | staffUsername | staffPassword | lang | registerMenuText | notificationSettingMenuText | dailyReportMenuText | managerUsername | managerPassword | viewNotificationsMenuText | notificationMenuText | notificationSettingText | addBtn | successSave       | deleteSuccess       | viewNotification   |
      | 27000002      | 123456        | en   | Register         | Notification Setting        | Daily Report        | 9999999         | triarrow        | View Notifications        | Notification         | Notification Setting    | Add    | Save successfully | Delete successfully | View Notifications |

#-------------------------------------------------------------------------------#