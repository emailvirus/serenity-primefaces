@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Notification Setting display
  As an user
  I want to be able use Notification Setting

  Scenario Outline: Open Notification Setting and verify start screen with out setting
    When I open Login page
    And I input my credentials username <number> and password <string>
    And I change language to <lang>
    And I open submenu <notificationMenu> of parent menu <parentMenuText>
    Then The system should open '<pageTitle>' page
    And In Notification Setting screen, System show list button can not use
      | Add    |
      | Delete |
    And In Notification Setting screen, Table in the right have <numberClm> columns
    And In Notification Setting screen, Table in the right have columns like below
      | Employee Code |
      | Employee Name |
      | Type          |
      | Enable?       |
      | Unread        |
    And In Notification Setting screen, Table in the right do not have any record
    And In Notification Setting screen, Table in the left have list select box can select
      | Branch        |
      | Position      |
      | Employee Name |
    And In Notification Setting screen, link View Notifications is <statusViewNotifications>
    And I logout from system

    Examples:
      | notificationMenu     | pageTitle    | parentMenuText | numberClm | statusViewNotifications | number   | string   | lang |
      | Notification Setting | Notification | Notification   | 6         | Not Visible             | 13000002 | triarrow | en   |


  @LoggedIn
  Scenario Outline: Open Notification Setting and verify start screen have setting
    When I open submenu <notificationMenu> of parent menu <parentMenuText>
    Then The system should open '<pageTitle>' page
    And In Notification Setting screen, Table in the right have <numberClm> columns
    And In Notification Setting screen, Table in the right have any record
    And In Notification Setting screen, Table in the right have columns like below
      | Employee Code |
      | Employee Name |
      | Type          |
      | Enable?       |
      | Unread        |
    And In Notification Setting screen, Table in the left have list select box can select
      | Branch        |
      | Position      |
      | Employee Name |
    And In Notification Setting screen, link View Notifications is <statusViewNotifications>

    Examples:
      | notificationMenu     | pageTitle    | parentMenuText | numberClm | statusViewNotifications |
      | Notification Setting | Notification | Notification   | 6         | Visible                 |

  @LoggedIn
  Scenario Outline: Open Notification Setting click view notification
    When I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, link View Notifications is <statusViewNotifications>
    And In Notification Setting screen, I click in <viewNotification>
    Then In Notification Setting screen, System show screen View Notification have buttons
      | Mark all as read     |
      | Notification Setting |

    Examples:
      | notificationMenu     | parentMenuText | viewNotification   | statusViewNotifications |
      | Notification Setting | Notification   | View Notifications | Visible                 |


  Scenario Outline: Open Notification Setting, select one branch, one position, one employee name and add
    When I open Login page
    And I input my credentials username <number> and password <string>
    And I change language to <lang>
    And I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition           | valueEmpName           |
      | 大阪府         | second in list dropdown | third in list dropdown |
    And In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, Table in the right have Employee Name selected added
    And In Notification Setting screen, link View Notifications is <viewNotificationsVisible>
    And In Notification Setting screen, System show message <successSave>
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And In Notification Setting screen, link View Notifications is <viewNotificationsNotVisible>

#    try add again after delete
    When In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, Table in the right have Employee Name selected added
    And In Notification Setting screen, System show message <successSave>
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And I logout from system
    Examples:
      | notificationMenu     | parentMenuText | number   | string   | lang | addBtn | successSave       | deleteSuccess       | viewNotificationsVisible | viewNotificationsNotVisible |
      | Notification Setting | Notification   | 13000002 | triarrow | en   | Add    | Save successfully | Delete successfully | Visible                  | Not Visible                 |


  Scenario Outline: Open Notification Setting, select one branch, all position, one employee name and add
    When I open Login page
    And I input my credentials username <number> and password <string>
    And I change language to <lang>
    And I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName           |
      | 大阪府         | All position  | third in list dropdown |
    And In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, Table in the right have Employee Name selected added
    And In Notification Setting screen, link View Notifications is <viewNotificationsVisible>
    And In Notification Setting screen, System show message <successSave>
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And In Notification Setting screen, link View Notifications is <viewNotificationsNotVisible>

    #    try add again after delete
    When In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, Table in the right have Employee Name selected added
    And In Notification Setting screen, System show message <successSave>

    When In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, System show message <existedEmpMessage>
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And In Notification Setting screen, link View Notifications is <viewNotificationsNotVisible>
    And I logout from system

    Examples:
      | notificationMenu     | parentMenuText | number   | string   | lang | addBtn | successSave       | deleteSuccess       | existedEmpMessage | viewNotificationsVisible | viewNotificationsNotVisible |
      | Notification Setting | Notification   | 13000002 | triarrow | en   | Add    | Save successfully | Delete successfully | Employee existed  | Visible                  | Not Visible                 |


  Scenario Outline: Open Notification Setting, select one branch, all position, all employee name and add
    When I open Login page
    And I input my credentials username <number> and password <string>
    And I change language to <lang>
    And I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName |
      | random      | All position  | All employee |
    And In Notification Setting screen, I click in <addBtn>
    Then In Notification Setting screen, System show message <successSave>
    And In Notification Setting screen, Table in the right have all employee in Employee Name added

    And In Notification Setting screen, I delete random in table notification, show message <deleteSuccess>

  #try add all again after delete
    When In Notification Setting screen, I click in <addBtn>
    And In Notification Setting screen, System show message <successSave>
    Then In Notification Setting screen, Table in the right have all employee in Employee Name added
    And In Notification Setting screen, link View Notifications is <viewNotificationsVisible>
    And In Notification Setting screen, I delete all in table notification, show message <deleteSuccess>
    And In Notification Setting screen, link View Notifications is <viewNotificationsNotVisible>
    And I logout from system


    Examples:
      | notificationMenu     | parentMenuText | number   | string   | lang | addBtn | successSave       | deleteSuccess       | viewNotificationsNotVisible | viewNotificationsVisible |
      | Notification Setting | Notification   | 13000002 | triarrow | en   | Add    | Save successfully | Delete successfully | Not Visible                 | Visible                  |


  Scenario Outline: Open Notification Setting,check button Add with other conditions select dropdown
    When I open Login page
    And I input my credentials username <number> and password <string>
    And I change language to <lang>
    And I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition | valueEmpName |
      | 青森県         |               |              |
    Then In Notification Setting screen, System show list button can not use
      | Add |

    When In Notification Setting screen, i select more dropdown with value below
      | valueBranch | valuePosition           | valueEmpName |
      | 大阪府         | second in list dropdown |              |
    Then In Notification Setting screen, System show list button can not use
      | Add |

    When In Notification Setting screen, i select more dropdown with value below
      | valueBranch            | valuePosition          | valueEmpName |
      | first in list dropdown | first in list dropdown | All employee |
    Then In Notification Setting screen, System show list button can use
      | Add |
    And I logout from system
    
    Examples:
      | notificationMenu     | parentMenuText | number   | string   | lang |
      | Notification Setting | Notification   | 13000002 | triarrow | en   |


  @LoggedIn
  Scenario Outline: Open Notification Setting and verify paging last, first, next, previous
    When I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, I click button <nextPage> page on paging
    Then In Notification Setting screen, Table should show <nextPage> page

    When In Notification Setting screen, I click button <lastPage> page on paging
    Then In Notification Setting screen, Table should show <lastPage> page

    When In Notification Setting screen, I click button <previousPage> page on paging
    Then In Notification Setting screen, Table should show <previousPage> page
    And In Notification Setting screen, Table show result with <numberPaging> results in page

    When In Notification Setting screen, I click button <firstPage> page on paging
    Then In Notification Setting screen, Table should show <firstPage> page
    And In Notification Setting screen, Table show result with <numberPaging> results in page

    Examples:
      | notificationMenu     | parentMenuText | nextPage | lastPage | previousPage | firstPage | numberPaging |
      | Notification Setting | Notification   | next     | last     | previous     | first     | 20           |


  @LoggedIn
  Scenario Outline: Open Notification Setting click check box enable
    When I open submenu <notificationMenu> of parent menu <parentMenuText>
    And In Notification Setting screen, I click random checkbox in column enable
    Then In Notification Setting screen, System show list button can not use
      | Add    |
      | Delete |
    And In Notification Setting screen, link View Notifications is <statusViewNotifications>
    And In Notification Setting screen, Table in the left have list select box can select
      | Branch        |
      | Position      |
      | Employee Name |
    And In Notification Setting screen, Table in the right have <numberClm> columns
    And In Notification Setting screen, Table in the right have columns like below
      | Employee Code |
      | Employee Name |
      | Type          |
      | Enable?       |
      | Unread        |

    Examples:
      | notificationMenu     | parentMenuText | numberClm | statusViewNotifications |
      | Notification Setting | Notification   | 6         | Visible                 |