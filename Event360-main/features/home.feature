Feature: Home Button & Log Out Button
  As a user of the service
  I want to have the button to the home page
  So I can navigate to the home page/logout from any page of the website

  Background:
    Given An administrator is signed in
    And there is an application "TestNXT"

  Scenario Outline: User clicks the "Home" button from other pages
    Given User is on "<a page that is not the dashboard page>"
    When User clicks on "FashioNXT CRM Tool"
    Then User should be redirected to the admin dashboard

    Examples:
      | a page that is not the dashboard page |
      | /app/TestNXT/admin/index              |
      | /app/TestNXT/posts                    |
      | /crmusers                             |

  Scenario Outline: User clicks the "Log Out" button from other pages
    Given User is on "<a page that is not the dashboard page>"
    When User clicks on "Log Out"
    Then User should be redirected to the login page

    Examples:
      | a page that is not the dashboard page |
      | /app/TestNXT/admin/index              |
      | /app/TestNXT/posts                    |
      | /crmusers                             |
