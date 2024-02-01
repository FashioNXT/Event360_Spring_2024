Feature: Redirect to home if user is not an admin
As a user
I want to be redirected to the home page if I try to navigate to a page that is not the home page

  Background:
    Given User is logged in
    And there is an application "TestNXT"

  Scenario Outline: User is on home page and tries to navigate to elsewhere
    Given User is on the home page
    And User tries to navigate to "<a page that is not the home page>"
    Then User should be redirected to the user dashboard

    Examples:
      | a page that is not the home page |
      | /app/TestNXT/admin               |
      | /app/TestNXT/posts               |
      | /crmusers                        |
