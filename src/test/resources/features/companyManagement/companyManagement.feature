@version:3.1.5
@version:Sprint-1.1
@issue:
Feature: company management
  As a user
  I want to manage company
  So I can view, add new, edit and delete companies

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: initialization screen
    When I open submenu <submenuText> of menu <menuText>
    Then The system should show initialization screen of Company management page

#    When In Company management screen, I click button Export
#    Then The system should download file excel company details

    When In Company management screen, I click button Expand Branch
    Then The system should expand all row in table company

    Examples:
      | submenuText        | menuText |
      | Company Management | Common   |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: paging
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I click button last page on paging
    Then The table company should show last page

    When In Company management screen, I click button first page on paging
    Then The table company should show first page

    When In Company management screen, I click page <pageNumberOne> on paging
    Then The table company should change to selected page <pageNumberOne>

    When In Company management screen, I click button next
    Then The table company should change to selected page <pageNumberOne> + 1

    When In Company management screen, I click button back
    Then The table company should change to selected page <pageNumberOne>

    Examples:
      | submenuText        | menuText | pageNumberOne |
      | Company Management | Common   | 2             |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: search company
    When I open submenu <submenuText> of menu <menuText>
    And I fill value <invalidSearchText> for input search in Company management screen
    And In Company management screen, I click button Search
    Then In Company management screen, the system should show table company with no record found

    When I fill value <validSearchText> for input search in Company management screen
    And In Company management screen, I click button Search
    Then The system should show table company with record found

    Examples:
      | submenuText        | menuText | invalidSearchText | validSearchText |
      | Company Management | Common   | aaaaa             | a               |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: filter
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    Then Table Company should show only records contain text '<filterText>' in column '<columnCompanyNameTitle>'

    When In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>' and enter
    Then Table Company should show only records contain text '<filterText>' in column '<columnCompanyNameTitle>'

    When In Company management screen, I fill value '<filterText>' for filter in column '<columnCustomerCodeTitle>'
    Then Table Company should show only records contain text '<filterText>' in column '<columnCustomerCodeTitle>'

    When In Company management screen, I fill value '<filterText>' for filter in column '<columnCustomerCodeTitle>' and enter
    Then Table Company should show only records contain text '<filterText>' in column '<columnCustomerCodeTitle>'

    When In Company management screen, I choose value '<headOfficeFilterText>' for dropdown filter in column '<columnHeadOfficeTitle>'
    Then Table Company should show only records contain text '<headOfficeFilterText>' in column '<columnHeadOfficeTitle>'

    When In Company management screen, I choose value '<workTypeFilterText>' for dropdown filter in column '<columnWorkTypeTitle>'
    Then Table Company should show only records contain text '<workTypeFilterText>' in column '<columnWorkTypeTitle>'

    Examples:
      | submenuText        | menuText | filterText | columnCompanyNameTitle | columnCustomerCodeTitle | columnHeadOfficeTitle | columnWorkTypeTitle | headOfficeFilterText | workTypeFilterText |
      | Company Management | Common   | a          | Company name           | Customer code           | Head office           | Work type           | 東京都                  | ソフトウェア             |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: sorter
    Given A list of column title need toggle in Company management
      | Listed  |
      | Website |
    When I open submenu <submenuText> of menu <menuText>
    And I open toggle menu in table company
    And I toggle all column in table company
    And In Company management screen, I sort <columnCompanyNameTitle> column by <sortType>
    Then The system should show table company sorted by column <columnCompanyNameTitle> and <sortType>

    When In Company management screen, I sort <columnCompanyNameTitle> column by <sortType>
    Then The system should show table company sorted by column <columnCompanyNameTitle> and <descending>

    When In Company management screen, I sort <columnCustomerCodeTitle> column by <sortType>
    Then The system should show table company sorted by column <columnCustomerCodeTitle> and <sortType>

    When In Company management screen, I sort <columnCustomerCodeTitle> column by <sortType>
    Then The system should show table company sorted by column <columnCustomerCodeTitle> and <descending>

    When In Company management screen, I sort <columnHeadOfficeTitle> column by <sortType>
    Then The system should show table company sorted by column <columnHeadOfficeTitle> and <sortType>

    When In Company management screen, I sort <columnHeadOfficeTitle> column by <descending>
    Then The system should show table company sorted by column <columnHeadOfficeTitle> and <descending>

    When In Company management screen, I sort <columnWorkTypeTitle> column by <sortType>
    Then The system should show table company sorted by column <columnWorkTypeTitle> and <sortType>

    When In Company management screen, I sort <columnWorkTypeTitle> column by <descending>
    Then The system should show table company sorted by column <columnWorkTypeTitle> and <descending>

    When In Company management screen, I sort <columnListedTitle> column by <sortType>
    Then The system should show table company sorted by column <columnListedTitle> and <sortType>

    When In Company management screen, I sort <columnListedTitle> column by <sortType>
    Then The system should show table company sorted by column <columnListedTitle> and <descending>

    When In Company management screen, I sort <columnWebsiteTitle> column by <sortType>
    Then The system should show table company sorted by column <columnWebsiteTitle> and <sortType>

    When In Company management screen, I sort <columnWebsiteTitle> column by <sortType>
    Then The system should show table company sorted by column <columnWebsiteTitle> and <descending>

    Examples:
      | submenuText        | menuText | columnCompanyNameTitle | columnCustomerCodeTitle | columnHeadOfficeTitle | columnWorkTypeTitle | columnListedTitle | columnWebsiteTitle | sortType | descending |
      | Company Management | Common   | Company name           | Customer code           | Head office           | Work type           | Listed            | Website            | ASC      | DESC       |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: when add new company, click reset after fill all fields
    When I open submenu <submenuText> of menu <menuText>
    And I create new company with name '<companyName>'
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z111         | 東京都, 山梨県 | anlh@arrow-tech.vn |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should show initialization screen of Company details

    Examples:
      | submenuText        | menuText | companyName  | buttonText |
      | Company Management | Common   | Test company | Reset      |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: when add new company, click cancel after fill all fields
    When I open submenu <submenuText> of menu <menuText>
    And I create new company with name '<companyName>'
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z111         | 東京都, 山梨県 | anlh@arrow-tech.vn |
    And In Company Detail screen, I click button back
    Then The system should show table company with record found

    Examples:
      | submenuText        | menuText | companyName  |
      | Company Management | Common   | Test company |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: add new company and fill only required field
    When I open submenu <submenuText> of menu <menuText>
    And I create new company with name '<companyName>'
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice |
      | Test company    | 土木       | Type One | 岩手県        |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should save company success

    Examples:
      | submenuText        | menuText | companyName  | buttonText |
      | Company Management | Common   | Test company | Save       |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: delete company if user is admin
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    Then In Company management screen, the system should show button delete

    When In Company management screen, I click button Delete
    And In Company management screen, I confirm delete company
    Then The system should save company success

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex |
      | Company Management | Common   | Test company | Company name           | 0        |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: add new company and fill all fields
    When I open submenu <submenuText> of menu <menuText>
    And I create new company with name '<companyName>'
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z111         | 東京都, 山梨県 | anlh@arrow-tech.vn |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should save company success

    Examples:
      | submenuText        | menuText | companyName  | buttonText |
      | Company Management | Common   | Test company | Save       |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: verify recent activities
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    And In Company management screen, I click button Edit
    And In Company Detail screen, I view recent activities with company
    Then The system should open recent activities screen

    When In Company Detail screen, I close recent activities screen
    And In Company Detail screen, I click button back
    Then The system should show table company with record found

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex | companyName  |
      | Company Management | Common   | Test company | Company name           | 0        | Test company |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: when edit company, click cancel after fill all data
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    And I edit company with name <companyName>
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z999         | 静岡県, 岡山県 | anlh2207@gmail.com |
    And In Company Detail screen, I click button back
    Then The system should show table company with record found

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex | companyName  |
      | Company Management | Common   | Test company | Company name           | 0        | Test company |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: when edit company, click reset after fill all data
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    And I edit company with name <companyName>
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z999         | 静岡県, 岡山県 | anlh2207@gmail.com |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should reset Company Detail screen

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex | companyName  | buttonText |
      | Company Management | Common   | Test company | Company name           | 0        | Test company | Reset      |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: save immediately after open edit screen
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I select row '<rowIndex>'
    And In Company management screen, I click button Edit
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should save company success

    Examples:
      | submenuText        | menuText | rowIndex | buttonText |
      | Company Management | Common   | 0        | Save       |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: edit company with only required fields
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    And I edit company with name <companyName>
    And I input company detail as below
      | companyFullName     | workType | listed     | headOffice |
      | Test company edited | コールセンター  | Other Type | 静岡県        |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should save company success

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex | buttonText | companyName         |
      | Company Management | Common   | Test company | Company name           | 0        | Save       | Test company edited |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: edit company and fill all field
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    And I edit company with name <companyName>
    And I input company detail as below
      | companyFullName | workType | listed   | headOffice | customerCode | branches | website            |
      | Test company    | 土木       | Type One | 岩手県        | z999         | 静岡県, 岡山県 | anlh2207@gmail.com |
    And In Company Detail screen, I click '<buttonText>' button
    Then The system should save company success

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex | buttonText | companyName  |
      | Company Management | Common   | Test company | Company name           | 0        | Save       | Test company |

#-------------------------------------------------------------------------------#

  @LoggedIn
  Scenario Outline: delete company if user is admin
    When I open submenu <submenuText> of menu <menuText>
    And In Company management screen, I fill value '<filterText>' for filter in column '<columnCompanyNameTitle>'
    And In Company management screen, I select row '<rowIndex>'
    Then In Company management screen, the system should show button delete

    When In Company management screen, I click button Delete
    And In Company management screen, I confirm delete company
    Then The system should save company success

    Examples:
      | submenuText        | menuText | filterText   | columnCompanyNameTitle | rowIndex |
      | Company Management | Common   | Test company | Company name           | 0        |

#-------------------------------------------------------------------------------#

  Scenario Outline: cannot delete a company if user is not admin
    When I open Login page
    And I input my credentials username <username> and password <password>
    And I change language to <lang>
    And I open submenu <submenuText> of menu <menuText>
    Then In Company management screen, the system should not show button delete

    Examples:
      | username | password | lang | submenuText        | menuText |
      | 22000001 | 123456   | en   | Company Management | Common   |

#-------------------------------------------------------------------------------#