@javascript @tool @tool_monitor @tool_monitor_rules
Feature: tool_monitor_rule
  In order to manage rules
  As an admin
  I need to create a rule, edit a rule, duplicate a rule and delete a rule

  Background:
    Given the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1        |
    And the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@asd.com |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
    And   I log in as "admin"
    And   I follow "Course 1"
    And   I navigate to "Event monitoring rules" node in "Course administration > Reports"
    And   I press "Add a new rule"
    And   I set the following fields to these values:
      | name              | New rule course level                             |
      | plugin            | Forum                                             |
      | eventname         | Post created                                      |
      | id_description    | I want a rule to monitor posts created on a forum |
      | frequency         | 1                                                 |
      | minutes           | 1                                                 |
      | Message template  | The forum post was created. {modulelink}          |
    And   I press "Save changes"
    And   I navigate to "Event monitoring rules" node in "Site administration > Reports"
    And   I press "Add a new rule"
    And   I set the following fields to these values:
      | name              | New rule site level                               |
      | plugin            | Forum                                             |
      | eventname         | Post created                                      |
      | id_description    | I want a rule to monitor posts created on a forum |
      | frequency         | 1                                                 |
      | minutes           | 1                                                 |
      | Message template  | The forum post was created. {modulelink}          |
    And  I press "Save changes"
    And  I log out

  Scenario: Add a rule on course level
    Given I log in as "teacher1"
    And   I am on homepage
    And   I follow "Course 1"
    And   I navigate to "Event monitoring rules" node in "Course administration > Reports"
    When  I press "Add a new rule"
    And   I set the following fields to these values:
      | name              | New rule                                          |
      | plugin            | Forum                                             |
      | eventname         | Post created                                      |
      | id_description    | I want a rule to monitor posts created on a forum |
      | frequency         | 1                                                 |
      | minutes           | 1                                                 |
      | Message template  | The forum post was created. {modulelink}          |
    And   I press "Save changes"
    Then  I should see "New rule"
    And   I should see "I want a rule to monitor posts created on a forum"
    And   I should see "Forum"
    And   I should see "Post created"
    And   I should see "1 times in 1 minutes"

  Scenario: Delete a rule on course level
    Given I log in as "teacher1"
    And   I follow "Course 1"
    And   I navigate to "Event monitoring rules" node in "Course administration > Reports"
    When  I click on "Delete rule" "link"
    Then  I should see "Are you sure you want to delete rule \"New rule course level\"?"
    And   I press "Yes"
    And   I should see "Rule successfully deleted"
    And   I should not see "New rule course level"

  Scenario: Edit a rule on course level
    Given I log in as "teacher1"
    And   I follow "Course 1"
    And   I navigate to "Event monitoring rules" node in "Course administration > Reports"
    When  I click on "Edit rule" "link"
    And   I set the following fields to these values:
      | name              | New rule quiz                                  |
      | plugin            | Quiz                                           |
      | eventname         | Quiz attempt deleted                           |
      | id_description    | I want a rule to monitor quiz attempts deleted |
      | frequency         | 5                                              |
      | minutes           | 5                                              |
      | Message template  | Quiz attempt deleted. {modulelink}             |
    And   I press "Save changes"
    Then  I should see "New rule quiz"
    And   I should see "I want a rule to monitor quiz attempts deleted"
    And   I should see "Quiz attempt deleted"
    And   I should see "5 times in 5 minutes"

  Scenario: Duplicate a rule on course level
    Given I log in as "teacher1"
    And   I follow "Course 1"
    And   I navigate to "Event monitoring rules" node in "Course administration > Reports"
    When  I click on "Duplicate rule" "link"
    Then  I should see "Rule successfully duplicated"
    And   "#toolmonitorrules_r1" "css_element" should appear before "#toolmonitorrules_r2" "css_element"
    And   I should see "New rule"
    And   I should see "I want a rule to monitor posts created on a forum"
    And   I should see "Forum"
    And   I should see "Post created"
    And   I should see "1 times in 1 minutes"

  Scenario: Add a rule on site level
    Given I log in as "admin"
    And   I navigate to "Event monitoring rules" node in "Site administration > Reports"
    When  I press "Add a new rule"
    And   I set the following fields to these values:
      | name              | New rule                                          |
      | plugin            | Forum                                             |
      | eventname         | Post created                                      |
      | id_description    | I want a rule to monitor posts created on a forum |
      | frequency         | 1                                                 |
      | minutes           | 1                                                 |
      | Message template  | The forum post was created. {modulelink}          |
    And   I press "Save changes"
    Then  I should see "New rule"
    And   I should see "I want a rule to monitor posts created on a forum"
    And   I should see "Forum"
    And   I should see "Post created"
    And   I should see "1 times in 1 minutes"

  Scenario: Delete a rule on site level
    Given I log in as "admin"
    And   I navigate to "Event monitoring rules" node in "Site administration > Reports"
    When  I click on "Delete rule" "link"
    Then  I should see "Are you sure you want to delete rule \"New rule site level\"?"
    And   I press "Yes"
    And   I should see "Rule successfully deleted"
    And   I should not see "New rule site level"

  Scenario: Edit a rule on site level
    Given I log in as "admin"
    And   I navigate to "Event monitoring rules" node in "Site administration > Reports"
    When  I click on "Edit rule" "link"
    And   I set the following fields to these values:
      | name              | New Rule Quiz                                  |
      | plugin            | Quiz                                           |
      | eventname         | Quiz attempt deleted                           |
      | id_description    | I want a rule to monitor quiz attempts deleted |
      | frequency         | 5                                              |
      | minutes           | 5                                              |
      | Message template  | Quiz attempt deleted. {modulelink}             |
    And   I press "Save changes"
    Then  I should see "New Rule Quiz"
    And   I should see "I want a rule to monitor quiz attempts deleted"
    And   I should see "Quiz attempt deleted"
    And   I should see "5 times in 5 minutes"

  Scenario: Duplicate a rule on site level
    Given I log in as "admin"
    And   I navigate to "Event monitoring rules" node in "Site administration > Reports"
    When  I click on "Duplicate rule" "link"
    Then  I should see "Rule successfully duplicated"
    And   "#toolmonitorrules_r2" "css_element" should appear after "#toolmonitorrules_r1" "css_element"
    And   I should see "I want a rule to monitor posts created on a forum"
    And   I should see "Forum"
    And   I should see "Post created"
    And   I should see "1 times in 1 minutes"
