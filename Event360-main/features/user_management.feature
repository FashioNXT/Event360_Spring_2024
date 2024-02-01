Feature: Admin page displays user information
  As an admin user
  I want to view a table of user information on the admin page
  So that I can manage user accounts

  Background:
    Given An administrator is signed in

  Scenario Outline: Admin page displays user information for <site>
    Given I am on the /app/<site>/admin/index page
    Then I should see a table with the following columns:
      | User ID                            |
      | Name                               |
      | Email                              |
      | Membership Type                    |
      | Location                           |
      | Created at                         |
      | Avg minutes last 30 days           |
      | Fees from transaction last 30 days |
      | Access Enabled                     |

    Examples:
      | site     |
      | PlaNXT   |
      | EventNXT |
      | CastNXT  |

  Scenario Outline: User sees site name on user management page
    Given I am on the /app/<site>/admin/index page
    Then I should see "<site> User Management" heading on the page

    Examples:
      | site     |
      | PlaNXT   |
      | EventNXT |
      | CastNXT  |