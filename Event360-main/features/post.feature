Feature: Create new post
  As a user
  I want to create a new post
  So that I can share information with customers

  Background:
    Given An administrator is signed in

  Scenario: Create new post with title, content and image
    Given User is on the new post page
    When User fills in "Recipient" with "test@exmample.org" 
    And User fills in "Title" with "My Post"
    And User fills in "Content" with "This is a test post"
    And User attaches the file "test_image1.jfif" to "Image"
    And User clicks the "Send Post" button
    Then User should be on the show post page