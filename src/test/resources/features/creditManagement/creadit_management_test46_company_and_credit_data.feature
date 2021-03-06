@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: Credit management
  As a user
  I want use Credit management


  @LoggedIn
  Scenario Outline: select record -> duplicate -> save draft -> fail -> Reject->save draft -> success
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I change survey date to next day of selected record
    And In Credit Management page, I click button <btnSaveDraft>
    And I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I click button <btnSaveDraft>
    Then In Credit Management page, System show message <failMessage>

    When In Credit Management page, I click button <btnBack>
    And In Credit Management page, I click record <number0> in table Credit History in bottom
    And In Credit Management page, I click button <btnEdit>
    And In Credit Management page, I click button <btnReject>
    And In Credit Management page, I confirm action
    And In Credit Management page, System show message <successReject>
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I change survey date to next day of selected record
    And In Credit Management page, I click button <btnSaveDraft>
    Then In Credit Management page, System show message <successSaveDraft>

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnBack | rowIndex2CreditHistory | btnDuplicate | btnSaveDraft | failMessage                                                                                         | number0 | btnEdit | btnReject | successReject     | successSaveDraft  |
      | Credit Management | Accounting | A567              | 0        | back    | 0                      | Duplicate    | Save draft   | Cannot make new draft report because you could only have 1 draft report for this company once time. | 0       | Edit    | Reject    | Reject successful | Save successfully |


  @LoggedIn
  Scenario Outline: change screen and fill sample data New Report-->Back-->Edit-->Back-->View-->Back-->Duplicate.
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click button <btnBack>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndexCreditHistory> in table Credit History in bottom
    And In Credit Management page, I click button <btnEdit>
    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Reject             |
      | Choose file upload |
    And In Credit Management page, fields can select
      | Survey institute and information source |
      | Credit score rank                       |
      | Trading condition category              |
    And In Credit Management page, autocomplete fields can input
      | Branch Of request user |
      | Authorized by          |
      | Final authorized by    |
      | Request user account   |
    And In Credit Management page, System show list button can not use
      | Upload |
      | Cancel |
    And In Credit Management page, System show list button can use
      | Back |
    And In Credit Management page, fields required can input
      | Index for accounting system |
      | Credit score number         |
    And In Credit Management page, textarea can input
      | Cause of decision    |
      | Additional direction |
      | Accountant direction |
    When In Credit Management page, I click button <btnBack>
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnView>

    Then In Credit Management page, System show list button can use
      | Back      |
      | Duplicate |
    And In Credit Management page, fields required can not input
      | Index for accounting system |
      | Credit score number         |
    And In Credit Management page, autocomplete fields can not input
      | Branch Of request user |
      | Authorized by          |
      | Final authorized by    |
      | Request user account   |
    And In Credit Management page, textarea can not input
      | Cause of decision    |
      | Additional direction |
      | Accountant direction |
    And In Credit Management page, fields can not select
      | Survey institute and information source |
      | Credit score rank                       |
      | Trading condition category              |

    And In Credit Management page, I click button <btnBack>

    When In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Save draft         |
      | Reset              |
      | Choose file upload |
    And In Credit Management page, fields can select
      | Survey institute and information source |
      | Credit score rank                       |
      | Trading condition category              |
    And In Credit Management page, System show list button can not use
      | Upload |
      | Cancel |
    And In Credit Management page, System show list button can use
      | Back |
    And In Credit Management page, fields required can input
      | Index for accounting system |
      | Credit score number         |
    And In Credit Management page, autocomplete fields can input
      | Branch Of request user |
      | Authorized by          |
      | Final authorized by    |
      | Request user account   |
    And In Credit Management page, textarea can input
      | Cause of decision    |
      | Additional direction |
      | Accountant direction |

    And In Credit Management page, I click button <btnBack>

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnBack | btnEdit | rowIndexCreditHistory | rowIndex2CreditHistory | btnView | btnDuplicate | btnSaveDraft |
      | Credit Management | Accounting | A567              | 0        | Back    | Edit    | 0                     | 1                      | View    | Duplicate    | Save draft   |

  @LoggedIn
  Scenario Outline: select record -> duplicate -> reset
    When I open submenu <submenuText> of menu <menuText>
    And  I search customer by code <validCustomerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex2CreditHistory> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I click button <btnReset>
    And In Credit Management page, I confirm action
    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Save draft         |
      | Reset              |
      | Choose file upload |
    And In Credit Management page, System show list button can not use
      | Upload |
      | Cancel |
    And In Credit Management page, verify page after reset

    Examples:
      | submenuText       | menuText   | validCustomerCode | rowIndex | btnReset | rowIndex2CreditHistory | btnDuplicate |
      | Credit Management | Accounting | A567              | 0        | Reset    | 0                      | Duplicate    |

  @LoggedIn
  Scenario Outline: verify approve customer data
    When I open submenu <submenuText> of menu <menuText>
    And I search customer by code <customerCode>
    And I click checkbox left of a row <rowIndex> into table result
    And In accounting screen, I click button select
    And In Credit Management page, I click record <rowIndex> in table Credit History in bottom with View enable
    And In Credit Management page, I click button <btnDuplicate>
    And In Credit Management page, I click button <btnApprove>
    Then The system should show approve confirm dialog

    When In Credit Management page, I decline action
    Then In Credit Management page, System show list button can use
      | Back               |
      | Approve            |
      | Save draft         |
      | Reset              |
      | Choose file upload |
    When In Credit Management page, I click button <btnApprove>
    And In Credit Management page, I confirm action
    Then The system should show approve failure message because survey already existed

    When In Credit Management page, I change survey date to next day of selected record
    And In Credit Management page, I click button <btnApprove>
    And In Credit Management page, I confirm action
    Then The system should show approve success message

    Examples:
      | submenuText       | menuText   | customerCode | rowIndex | btnDuplicate | btnApprove |
      | Credit Management | Accounting | A567         | 0        | Duplicate    | Approve    |


