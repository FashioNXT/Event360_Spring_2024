Feature: NxtApp creation
  As an administrator
  The system should allow creating NxtApps

  Background:
    Given An administrator is signed in

  Scenario: Visiting manage applications page
    When User clicks on "Application Management"
    Then User should see the manage applications page

  Scenario: Creating a new NxtApp
    When User creates an application "TestApp" with valid parameters
    Then User should see "Application created."
  
  Scenario: Creating a new NxtApp with invalid parameters
    When User creates an application "TestApp" with invalid parameters
    Then User should see "Whoops! Check your form for possible errors"

  Scenario: Visit an application page
    When User creates an application "TestApp" with valid parameters
    And User visits the application page "TestApp"
    Then User should see "Application: TestApp"

  Scenario: Visit and edit an application page
    When User creates an application "TestApp" with valid parameters
    And User visits the application page "TestApp"
    When User edits the application "TestApp" with "description" "New description"
    Then User should see "New description"
  