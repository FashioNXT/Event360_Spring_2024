Feature: OAuth authorization flow

  Background:
    Given there is an application "TestNXT"

  Scenario: Successful OAuth authorization
    Given User has an account with email "user@example.com" and password "password"
    When User visits the OAuth authorization page
    And User enter their credentials "user@example.com" and "password"
    And User presses "Sign in"
    Then User should see the authorization code

  Scenario: Unsuccessful OAuth authorization
    When User visits the OAuth authorization page
    And User enter their credentials "user@example.com" and "wrongpassword"
    And User presses "Sign in"
    Then User should see "Incorrect email or password"
