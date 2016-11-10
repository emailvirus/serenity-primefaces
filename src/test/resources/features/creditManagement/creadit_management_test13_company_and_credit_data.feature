@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Credit management
  As a user
  I want use Credit management


  @LoggedIn
  Scenario Outline: search customer by other conditions, not mapping sansan with credit data
    When I open submenu <submenuText> of menu <menuText>
    And I fill value <validIdNameCard> for input id name card
    And I click search button in tab other conditions
    And The system should show table result with records
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    Then The system should show customer details screen
    And In Credit Management page, Table Credit History no record
    And In Credit Management page, System show list button can use
      | New report |
      | Back       |
    And In Credit Management page, fields required can input
      | Customer code (index) |
      | Company name          |
      | Company name in Kana  |
    And In Credit Management page, fields can select
      | Client code status |
    And In Credit Management page, fields not required can input
      | Year of starting business      |
      | Year of official establishment |
    And In Credit Management page, I click button <btnBack>

    Examples:
      | submenuText       | menuText   | validIdNameCard | rowIndex | btnBack |
      | Credit Management | Accounting | EC7B840A        | 0        | Back    |


  @LoggedIn
  Scenario Outline: search customer by other conditions, mapping sansan with credit data and Credit Investigation
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    Then The system should show customer details screen
    And In Credit Management page, System show list button can use
      | New report |
      | Back       |
    And In Credit Management page, fields required can not input
      | Customer code (index) |
      | Company name          |
      | Company name in Kana  |
    And In Credit Management page, fields can not select
      | Client code status |
    And In Credit Management page, fields not required can not input
      | Year of starting business      |
      | Year of official establishment |

    And In Credit Management page, I verify status edit, view, duplicate every record in table Credit History is true
    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex |
      | Credit Management | Accounting | A567              | 0        |


  @LoggedIn
  Scenario Outline: search customer by other conditions, mapping sansan with credit data but not have Credit Investigation
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And The system should show table result with records
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, Table Credit History no record
    And In Credit Management page, I click button <newRpBtn>
    And In Credit Management page, I select in <surveySelect> is <valueSurvey>
    And In Credit Management page, I select date in <indexSelect> is <valueIndex>
    And In Credit Management page, I type in <indexAccounting> is <valueIndexAccounting>
    And In Credit Management page, I click button <btnSaveDraft>
    And In Credit Management page, System show message <successSave>
    And In Credit Management page, I click record <rowIndexCreditHistory> in table Credit History in bottom
    And In Credit Management page, I click button <btnEdit>
    And In Credit Management page, I click button <btnReject>
    And In Credit Management page, I confirm action
    And In Credit Management page, System show message <successReject>
    Then In Credit Management page, Table Credit History no record
    And In Credit Management page, System show list button can use
      | New report |
      | Back       |
    And In Credit Management page, System show list button can not use
      | Edit      |
      | View      |
      | Duplicate |
    And In Credit Management page, fields required can input
      | Customer code (index) |
      | Company name          |
      | Company name in Kana  |
    And In Credit Management page, fields can select
      | Client code status |
    And In Credit Management page, fields not required can input
      | Year of starting business      |
      | Year of official establishment |
    And In Credit Management page, I click button <btnBack>

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | newRpBtn   | surveySelect                            | indexSelect    | indexAccounting             | valueSurvey | valueIndex | valueIndexAccounting | btnSaveDraft | rowIndexCreditHistory | btnEdit | btnReject | btnBack | successSave       | successReject     |
      | Credit Management | Accounting | a555              | 0        | New report | Survey institute and information source | Date of survey | Index for accounting system | 帝国データ       | 2016/10/18 | 12                   | Save draft   | 0                     | Edit    | Reject    | Back    | Save successfully | Reject successful |

  @LoggedIn
  Scenario Outline: verify screen View->Duplicate is same
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnView>
    And In Credit Management page, I save data in this page
    And In Credit Management page, I click button <btnDuplicate>
    Then In Credit Management page, page Duplicate is same page View
    And In Credit Management page, I click button <btnBack>

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnBack | rowIndex2CreditHistory | btnView | btnDuplicate |
      | Credit Management | Accounting | A567              | 0        | Back    | 1                      | View    | Duplicate    |


  @LoggedIn
  Scenario Outline: select record -> duplicate start screen
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>

    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Save draft         |
      | Reset              |
      | Choose file upload |
    And In Credit Management page, System show list button can not use
      | Upload |
      | Cancel |
    And In Credit Management page, fields required can input
      | Index for accounting system |
      | Credit score number         |
    And In Credit Management page, textarea can input
      | Cause of decision    |
      | Additional direction |
      | Accountant direction |

    When In Credit Management page, I select tab have name is <tabBusiness>
    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Save draft         |
      | Reset              |
      | Choose file upload |
    And In Credit Management page, fields required can input
      | Index for accounting system |
      | Zip code of HQ              |
      | Address of HQ (all)         |
      | Tel.                        |
    And In Credit Management page, fields can select
      | Fiscal closing month |
    And In Credit Management page, fields not required can input
      | Company index of research institute |
      | Fax.                                |
      | Number of employees                 |
      | Capital fund                        |
      | Url                                 |
    When In Credit Management page, I select tab have name is <tabIndustryClassification>
    And In Credit Management page, fields not required can input
      | Rank of the same sector (Nation wide)         |
      | Population of the same industry (Nation wide) |
      | Rank of the same sector (Prefecture)          |
      | Population of the same industry (Prefecture)  |

    When In Credit Management page, I select tab have name is <tabInputFinance>
    Then In Credit Management page, System show list button can use
      | Back       |
      | Approve    |
      | Save draft |
      | Reset      |
      | Add new    |
    And In Credit Management page, System show list button can not use
      | Edit   |
      | Delete |

    When In Credit Management page, I select tab have name is <tabInputCustomer>
    Then In Credit Management page, System show list button can use
      | Back       |
      | Approve    |
      | Save draft |
      | Reset      |
    And In Credit Management page, System show list button can not use
      | Edit   |
      | Delete |
      | Cancel |
    And In Credit Management page, autocomplete fields can input
      | Branch Of request user |
      | Request user account   |
    And In Credit Management page, fields can select
      | Survey institute and information source |
    And In Credit Management page, fields required can input
      | Index for accounting system |
    And In Credit Management page, tab Input customer data textarea can input
    And In Credit Management page, I click button <btnBack>

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnBack | rowIndex2CreditHistory | tabBusiness      | btnDuplicate | tabIndustryClassification | tabInputFinance    | tabInputCustomer    |
      | Credit Management | Accounting | A567              | 0        | Back    | 0                      | Business factors | Duplicate    | Industry classification   | Input finance data | Input customer data |

  @LoggedIn
  Scenario Outline: select record -> duplicate -> back
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I memory data in table
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I click button <btnBack>
    Then In Credit Management page, System show list button can use
      | Back       |
      | New report |
      | View       |
      | Duplicate  |
    Then In Credit Management page, System show list button can not use
      | Edit |
    And In Credit Management page, fields required can not input
      | Customer code (index) |
      | Company name          |
      | Company name in Kana  |
    And In Credit Management page, fields can not select
      | Client code status |
    And In Credit Management page, fields not required can not input
      | Year of starting business      |
      | Year of official establishment |
    And In Credit Management page, data in table when back is same before

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnBack | rowIndex2CreditHistory | btnDuplicate |
      | Credit Management | Accounting | A567              | 0        | Back    | 0                      | Duplicate    |