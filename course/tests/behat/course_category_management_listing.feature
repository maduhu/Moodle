@core @core_course
Feature: Course category management interface performs as expected
  In order to test JS enhanced display of categories and subcategories.
  As a moodle admin
  I need to expand and collapse categories.

  @javascript
  Scenario: Test general look of management interface
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And I log in as "admin"
    And I go to the courses management page
    And I should see "Course and category management" in the "h2" "css_element"
    And I should see "Viewing Course categories"
    And I should see "Course categories" in the "h3" "css_element"
    And I should see the "Course categories" management page

  @javascript
  Scenario: Test view mode functionality
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | fullname | shortname | category | format |
      | Course 1 | C1 | CAT1 | topics |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I should see "Course categories" in the "#category-listing h3" "css_element"
    And I should see "Cat 1" in the "#category-listing" "css_element"
    And I should see "Viewing Course categories" in the ".view-mode-selector" "css_element"
    And I should not see "Course categories and courses" in the ".view-mode-selector .menu" "css_element"
    And I should not see "Course categories" in the ".view-mode-selector .menu" "css_element"
    And I should not see "Courses" in the ".view-mode-selector .menu" "css_element"
    When I click on "Viewing Course categories" "link" in the ".view-mode-selector" "css_element"
    Then I should see "Course categories and courses" in the ".view-mode-selector .menu" "css_element"
    And I should see "Course categories" in the ".view-mode-selector .menu" "css_element"
    And I should see "Courses" in the ".view-mode-selector .menu" "css_element"
    And I click on "Course categories and courses" "link" in the ".view-mode-selector .menu" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Course categories" in the "#category-listing h3" "css_element"
    And I should see "Courses" in the "#course-listing h3" "css_element"
    And I should see "Cat 1" in the "#category-listing" "css_element"
    And I should see "Please select a category" in the "#course-listing" "css_element"
    And I click on category "Cat 1" in the management interface
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Course categories" in the "#category-listing h3" "css_element"
    And I should see "Cat 1" in the "#course-listing h3" "css_element"
    And I should see "Cat 1" in the "#category-listing" "css_element"
    And I should see "Course 1" in the "#course-listing" "css_element"
    When I click on "Viewing Course categories" "link" in the ".view-mode-selector" "css_element"
    Then I should see "Courses" in the ".view-mode-selector .menu" "css_element"
    And I click on "Courses" "link" in the ".view-mode-selector .menu" "css_element"
    # Redirect.
    And I should see the "Courses" management page
    And I should see "Cat 1" in the "#course-listing h3" "css_element"
    And I should see "Course 1" in the "#course-listing" "css_element"
    And I click on course "Course 1" in the management interface
    # Redirect.
    And I should see the "Courses" management page with a course selected
    And I should see "Cat 1" in the "#course-listing h3" "css_element"
    And I should see "Course 1" in the "#course-listing" "css_element"
    And I should see "Course 1" in the "#course-detail h3" "css_element"
    And I should see "C1" in the "#course-detail .shortname" "css_element"
    And I should see "Course 1" in the "#course-detail .fullname" "css_element"
    And I should see "Topics" in the "#course-detail .format" "css_element"
    And I should see "Cat 1" in the "#course-detail .category" "css_element"

  Scenario: Test displaying of sub categories
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
      | Cat 2 | 0 | CAT2 |
      | Cat 1-1 | CAT1 | CAT3 |
      | Cat 1-2 | CAT1 | CAT4 |
      | Cat 1-1-1 | CAT3 | CAT5 |
      | Cat 1-1-2 | CAT3 | CAT6 |
      | Cat 2-1 | CAT2 | CAT7 |
      | Cat 2-1-1 | CAT7 | CAT8 |
    And the following "courses" exists:
      | fullname | shortname | category |
      | Course 1 | C1 | CAT1 |
      | Course 2 | C2 | CAT1 |
      | Course 3 | C3 | CAT3 |
      | Course 4 | C4 | CAT3 |
      | Course 5 | C5 | CAT5 |
      | Course 6 | C6 | CAT5 |
      | Course 7 | C7 | CAT8 |
      | Course 8 | C8 | CAT8 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should not see "Cat 1-1"
    And I should not see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click on "Cat 1" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click on "Cat 1-1" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should see "Cat 1-1-1"
    And I should see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click on "Cat 2" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should not see "Cat 1-1"
    And I should not see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should see "Cat 2-1"
    And I should not see "Cat 2-1-1"

  # This is similar to the above scenario except here we are going to use AJAX
  # to load the categories.
  @javascript @_cross_browser
  Scenario: Test AJAX loading of sub categories
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
      | Cat 2 | 0 | CAT2 |
      | Cat 1-1 | CAT1 | CAT3 |
      | Cat 1-2 | CAT1 | CAT4 |
      | Cat 1-1-1 | CAT3 | CAT5 |
      | Cat 1-1-2 | CAT3 | CAT6 |
      | Cat 2-1 | CAT2 | CAT7 |
      | Cat 2-1-1 | CAT7 | CAT8 |
    And the following "courses" exists:
      | fullname | shortname | category |
      | Course 1 | C1 | CAT1 |
      | Course 2 | C2 | CAT1 |
      | Course 3 | C3 | CAT3 |
      | Course 4 | C4 | CAT3 |
      | Course 5 | C5 | CAT5 |
      | Course 6 | C6 | CAT5 |
      | Course 7 | C7 | CAT8 |
      | Course 8 | C8 | CAT8 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should not see "Cat 1-1"
    And I should not see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click to expand category "CAT1" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click to expand category "CAT3" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should see "Cat 1-1-1"
    And I should see "Cat 1-1-2"
    And I should not see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click to expand category "CAT2" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should see "Cat 1-1-1"
    And I should see "Cat 1-1-2"
    And I should see "Cat 2-1"
    And I should not see "Cat 2-1-1"
    And I click to expand category "CAT7" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should see "Cat 1-1-1"
    And I should see "Cat 1-1-2"
    And I should see "Cat 2-1"
    And I should see "Cat 2-1-1"
    And I click to expand category "CAT1" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should not see "Cat 1-1"
    And I should not see "Cat 1-2"
    And I should not see "Cat 1-1-1"
    And I should not see "Cat 1-1-2"
    And I should see "Cat 2-1"
    And I should see "Cat 2-1-1"
    And I click to expand category "CAT1" in the management interface
    # AJAX action - no redirect.
    And I should see "Cat 1"
    And I should see "Cat 2"
    And I should see "Cat 1-1"
    And I should see "Cat 1-2"
    And I should see "Cat 1-1-1"
    And I should see "Cat 1-1-2"
    And I should see "Cat 2-1"
    And I should see "Cat 2-1-1"

  @javascript
  Scenario Outline: Top level categories are displayed correctly when resorted
    Given the following "categories" exists:
      | category | name | idnumber | sortorder |
      | 0 | Social studies | Ext003 | 1 |
      | 0 | Applied sciences | Sci001 | 2 |
      | 0 | Extended social studies | Ext002 | 3 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Re-sort categories" "link"
    And I should see "By name" in the ".category-listing-actions" "css_element"
    And I should see "By idnumber" in the ".category-listing-actions" "css_element"
    And I click on <sortby> "link" in the ".category-listing-actions" "css_element"
    # Redirect.
    And I should see the "Course categories" management page
    And I should see category listing <cat1> before <cat2>
    And I should see category listing <cat2> before <cat3>

  Examples:
    | sortby | cat1 | cat2 | cat3 |
    | "Re-sort categories" | "Social studies"          | "Applied sciences"        | "Extended social studies" |
    | "By name"            | "Applied sciences"        | "Extended social studies" | "Social studies" |
    | "By idnumber"        | "Extended social studies" | "Social studies" | "Applied sciences" |

  @javascript
  Scenario Outline: Sub categories are displayed correctly when resorted
    Given the following "categories" exists:
      | category | name | idnumber | sortorder |
      | 0 | Master cat  | CAT1 | 1 |
      | CAT1 | Social studies | Ext003 | 1 |
      | CAT1 | Applied sciences | Sci001 | 2 |
      | CAT1 | Extended social studies | Ext002 | 3 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Master cat" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I click on "Re-sort subcategories" "link"
    And I should see "By name" in the ".category-listing-actions" "css_element"
    And I should see "By idnumber" in the ".category-listing-actions" "css_element"
    And I click on <sortby> "link" in the ".category-listing-actions" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see category listing <cat1> before <cat2>
    And I should see category listing <cat2> before <cat3>

  Examples:
    | sortby | cat1 | cat2 | cat3 |
    | "Re-sort subcategories" | "Social studies"          | "Applied sciences"        | "Extended social studies" |
    | "By name"            | "Applied sciences"        | "Extended social studies" | "Social studies" |
    | "By idnumber"        | "Extended social studies" | "Social studies" | "Applied sciences" |

  @javascript
  Scenario Outline: Test courses are displayed correctly after being resorted.
    Given the following "categories" exists:
      | name | category 0| idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber | sortorder |
      | CAT1 | Social studies | Senior school | Ext003 | 1 |
      | CAT1 | Applied sciences  | Middle school | Sci001 | 2 |
      | CAT1 | Extended social studies  | Junior school | Ext002 | 3 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Cat 1" "link"
  # Redirect.
    And I should see the "Course categories and courses" management page
    And I click on "Re-sort courses" "link"
    And I should see "By fullname" in the ".course-listing-actions" "css_element"
    And I should see "By shortname" in the ".course-listing-actions" "css_element"
    And I should see "By idnumber" in the ".course-listing-actions" "css_element"
    And I click on <sortby> "link" in the ".course-listing-actions" "css_element"
  # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see course listing <course1> before <course2>
    And I should see course listing <course2> before <course3>

  Examples:
    | sortby | course1 | course2 | course3 |
    | "By fullname"        | "Applied sciences"        | "Extended social studies" | "Social studies" |
    | "By shortname"       | "Extended social studies" | "Applied sciences"        | "Social studies" |
    | "By idnumber"        | "Extended social studies" | "Social studies"          | "Applied sciences" |

  @javascript
  Scenario: Test course pagination
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |
      | CAT1 | Course 2 | Course 2 | C2 |
      | CAT1 | Course 3 | Course 3 | C3 |
      | CAT1 | Course 4 | Course 4 | C4 |
      | CAT1 | Course 5 | Course 5 | C5 |
      | CAT1 | Course 6 | Course 6 | C6 |
      | CAT1 | Course 7 | Course 7 | C7 |
      | CAT1 | Course 8 | Course 8 | C8 |
      | CAT1 | Course 9 | Course 9 | C9 |
      | CAT1 | Course 10 | Course 10 | C10 |
      | CAT1 | Course 11 | Course 11 | C11 |
      | CAT1 | Course 12 | Course 12 | C12 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Cat 1" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I click on "Re-sort courses" "link"
    And I click on "By idnumber" "link" in the ".course-listing-actions" "css_element"
    # Redirect.
    And I should see "Per page: 20" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 2" before "Course 3"
    And I should see course listing "Course 3" before "Course 4"
    And I should see course listing "Course 4" before "Course 5"
    And I should see course listing "Course 5" before "Course 6"
    And I should see course listing "Course 6" before "Course 7"
    And I should see course listing "Course 7" before "Course 8"
    And I should see course listing "Course 8" before "Course 9"
    And I should see course listing "Course 9" before "Course 10"
    And I should see course listing "Course 10" before "Course 11"
    And I should see course listing "Course 11" before "Course 12"
    And "#course-listing .listing-pagination" "css_element" should not exists
    And I click on "Per page: 20" "link" in the ".course-listing-actions" "css_element"
    And I should see "5" in the ".courses-per-page" "css_element"
    And I should see "10" in the ".courses-per-page" "css_element"
    And I should see "20" in the ".courses-per-page" "css_element"
    And I should see "All" in the ".courses-per-page" "css_element"
    And I click on "5" "link" in the ".courses-per-page" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 2" before "Course 3"
    And I should see course listing "Course 3" before "Course 4"
    And I should see course listing "Course 4" before "Course 5"
    And I should not see "Course 6"
    And I should not see "Course 7"
    And I should not see "Course 8"
    And I should not see "Course 9"
    And I should not see "Course 10"
    And I should not see "Course 11"
    And I should not see "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 1 to 5 of 12 courses"
    And I should not see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "2" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 1"
    And I should not see "Course 2"
    And I should not see "Course 3"
    And I should not see "Course 4"
    And I should not see "Course 5"
    And I should see course listing "Course 6" before "Course 7"
    And I should see course listing "Course 7" before "Course 8"
    And I should see course listing "Course 8" before "Course 9"
    And I should see course listing "Course 9" before "Course 10"
    And I should not see "Course 11"
    And I should not see "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 6 to 10 of 12 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "Next" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect. Test next link.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 1"
    And I should not see "Course 2"
    And I should not see "Course 3"
    And I should not see "Course 4"
    And I should not see "Course 5"
    And I should not see "Course 6"
    And I should not see "Course 7"
    And I should not see "Course 8"
    And I should not see "Course 9"
    And I should not see "Course 10"
    And I should see course listing "Course 11" before "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 11 to 12 of 12 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "First" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect. Test first link.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 2" before "Course 3"
    And I should see course listing "Course 3" before "Course 4"
    And I should see course listing "Course 4" before "Course 5"
    And I should not see "Course 6"
    And I should not see "Course 7"
    And I should not see "Course 8"
    And I should not see "Course 9"
    And I should not see "Course 10"
    And I should not see "Course 11"
    And I should not see "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 1 to 5 of 12 courses"
    And I should not see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "Last" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect. Test last link.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 1"
    And I should not see "Course 2"
    And I should not see "Course 3"
    And I should not see "Course 4"
    And I should not see "Course 5"
    And I should not see "Course 6"
    And I should not see "Course 7"
    And I should not see "Course 8"
    And I should not see "Course 9"
    And I should not see "Course 10"
    And I should see course listing "Course 11" before "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 11 to 12 of 12 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "Prev" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect. Test prev link.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 1"
    And I should not see "Course 2"
    And I should not see "Course 3"
    And I should not see "Course 4"
    And I should not see "Course 5"
    And I should see course listing "Course 6" before "Course 7"
    And I should see course listing "Course 7" before "Course 8"
    And I should see course listing "Course 8" before "Course 9"
    And I should see course listing "Course 9" before "Course 10"
    And I should not see "Course 11"
    And I should not see "Course 12"
    And "#course-listing .listing-pagination" "css_element" should exists
    And I should see "Showing courses 6 to 10 of 12 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"

  # We need at least 30 courses for this next test.
  @javascript
  Scenario: Test many course pagination
    Given the following "categories" exists:
      | name | category 0| idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |
      | CAT1 | Course 2 | Course 2 | C2 |
      | CAT1 | Course 3 | Course 3 | C3 |
      | CAT1 | Course 4 | Course 4 | C4 |
      | CAT1 | Course 5 | Course 5 | C5 |
      | CAT1 | Course 6 | Course 6 | C6 |
      | CAT1 | Course 7 | Course 7 | C7 |
      | CAT1 | Course 8 | Course 8 | C8 |
      | CAT1 | Course 9 | Course 9 | C9 |
      | CAT1 | Course 10 | Course 10 | C10 |
      | CAT1 | Course 11 | Course 11 | C11 |
      | CAT1 | Course 12 | Course 12 | C12 |
      | CAT1 | Course 13 | Course 13 | C13 |
      | CAT1 | Course 14 | Course 14 | C14 |
      | CAT1 | Course 15 | Course 15 | C15 |
      | CAT1 | Course 16 | Course 16 | C16 |
      | CAT1 | Course 17 | Course 17 | C17 |
      | CAT1 | Course 18 | Course 18 | C18 |
      | CAT1 | Course 19 | Course 19 | C19 |
      | CAT1 | Course 20 | Course 20 | C20 |
      | CAT1 | Course 21 | Course 21 | C21 |
      | CAT1 | Course 22 | Course 22 | C22 |
      | CAT1 | Course 23 | Course 23 | C23 |
      | CAT1 | Course 24 | Course 24 | C24 |
      | CAT1 | Course 25 | Course 25 | C25 |
      | CAT1 | Course 26 | Course 26 | C26 |
      | CAT1 | Course 27 | Course 27 | C27 |
      | CAT1 | Course 28 | Course 28 | C28 |
      | CAT1 | Course 29 | Course 29 | C29 |
      | CAT1 | Course 30 | Course 30 | C30 |
      | CAT1 | Course 31 | Course 31 | C31 |
      | CAT1 | Course 32 | Course 32 | C32 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Cat 1" "link"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I click on "Re-sort courses" "link"
    And I click on "By idnumber" "link" in the ".course-listing-actions" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 20" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 19" before "Course 20"
    And I should not see "Course 21"
    And I should see "Showing courses 1 to 20 of 32 courses"
    And I click on "Per page: 20" "link" in the ".course-listing-actions" "css_element"
    And I click on "100" "link" in the ".courses-per-page" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 100" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 19" before "Course 20"
    And I should see course listing "Course 21" before "Course 22"
    And I should see course listing "Course 31" before "Course 32"
    And "#course-listing .listing-pagination" "css_element" should not exists
    And I click on "Per page: 100" "link" in the ".course-listing-actions" "css_element"
    And I click on "5" "link" in the ".courses-per-page" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should see course listing "Course 1" before "Course 2"
    And I should see course listing "Course 4" before "Course 5"
    And I should not see "Course 6"
    And I should see "Showing courses 1 to 5 of 32 courses"
    And I should not see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "4" in the "#course-listing .listing-pagination" "css_element"
    And I should see "5" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "6" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "7" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "Last" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 30"
    And I should see course listing "Course 31" before "Course 32"
    And I should see "Showing courses 31 to 32 of 32 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "4" in the "#course-listing .listing-pagination" "css_element"
    And I should see "5" in the "#course-listing .listing-pagination" "css_element"
    And I should see "6" in the "#course-listing .listing-pagination" "css_element"
    And I should see "7" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "Last" in the "#course-listing .listing-pagination" "css_element"
    And I click on "4" "link" in the "#course-listing .listing-pagination" "css_element"
    # Redirect.
    And I should see the "Course categories and courses" management page
    And I should see "Per page: 5" in the ".course-listing-actions" "css_element"
    And I should not see "Course 15"
    And I should see course listing "Course 16" before "Course 17"
    And I should see course listing "Course 17" before "Course 18"
    And I should see course listing "Course 18" before "Course 19"
    And I should see course listing "Course 19" before "Course 20"
    And I should not see "Course 21"
    And I should see "Showing courses 16 to 20 of 32 courses"
    And I should see "First" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Prev" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "1" in the "#course-listing .listing-pagination" "css_element"
    And I should see "2" in the "#course-listing .listing-pagination" "css_element"
    And I should see "3" in the "#course-listing .listing-pagination" "css_element"
    And I should see "4" in the "#course-listing .listing-pagination" "css_element"
    And I should see "5" in the "#course-listing .listing-pagination" "css_element"
    And I should see "6" in the "#course-listing .listing-pagination" "css_element"
    And I should not see "7" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Next" in the "#course-listing .listing-pagination" "css_element"
    And I should see "Last" in the "#course-listing .listing-pagination" "css_element"

  Scenario: Test clicking to edit a course.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on category "Cat 1" in the management interface
    And I click on "edit" action for "Course 1" in management course listing
    # Redirect
    And I should see "Edit course settings"
    And I should see "Course 1"