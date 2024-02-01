Feature: Admin page displays user information
  As an admin user
  I want to view user analytics

  Background:
    Given An administrator is signed in
    
  Scenario: View app user analytics page
    Given I am on the "/app/<site>/analytics" page
    Then I should see "<site> User Analytics" as the header
    Then I should see a pie chart
    And I should see a bar chart
    And I should see a line chart
    And I should see a histogram chart
    And I should see chart selectors

    Examples:
      | site     |
      | PlaNXT   |
      | EventNXT |
      | CastNXT  |

