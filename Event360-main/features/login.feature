Feature: Index page with Login and Register form
  The first page that user sees when they visit the website
  The user can login or register from this page

  Background:
    Given User is on the login page

  Scenario: User visits the index page
    Then User should see "Login"
    And User should see "Register"

  Scenario: User selects a radio button on the register page
    When User select the "user" radio button
    Then the "user" radio button should be checked
    And User select the "admin" radio button
    Then the "admin" radio button should be checked

  Scenario Outline: User tries to register with valid credentials
    When User clicks on "Register"
    And User enter their credentials "<name>", "<email>", and "<password>"
    And User presses "Register"
    Then User should be redirected to the user dashboard

    Examples:
      | name    | email              | password |
      | Alice   | alice@example.com  | password |
      | Bob     | bob@example.com    | secret   |

  Scenario Outline: Unregister user tries to login
    When User clicks on "Login"
    And User enter their credentials "<email>" and "<password>"
    And User presses "Sign in"
    Then User should see an error message

    Examples:
      | email              | password      |
      | new@example.com    | wrongpassword |

  Scenario Outline: Registered user tries to login
    Given User is registered with credentials "<email>" and "<password>"
    When User clicks on "Login"
    And User enter their credentials "<email>" and "<password>"
    And User presses "Sign in"
    Then User should be redirected to the user dashboard

    Examples:
      | email              | password |user
      | alice@example.com  | password |
      | bob@example.com    | secret   |
      | charlie@example.com| topsecret|

  Scenario Outline: Registered user tries to login with wrong password
    Given User is registered with credentials "<email>" and "<password>"
    When User clicks on "Login"
    And User enter their credentials "<email>" and "wrongpassword"
    And User presses "Sign in"
    Then User should see an error message

    Examples:
      | email              | password |
      | alice@example.com  | password |
      | bob@example.com    | secret   |
      | charlie@example.com| topsecret|
  
  Scenario: User visits page without authorization
    Given User is on "<a page that requires authorization>"
    And User should see "User Not Logged-In. Please Log-In/Register"

    Examples:
      | a page that requires authorization  |
      | /dashboard                          |
      | /home                               |
      | /app/PlaNXT                         |
      | /app/PlaNXT/admin                   |
      | /app/PlaNXT/analytics               |
      | /app/PlaNXT/posts                   |
      | /crmusers                           |
