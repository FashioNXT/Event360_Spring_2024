Feature: Create a new email template
    As a user
    I want to create a new email template
    So that I can use it without typing words each time

    Background:
        Given UAn administrator is signed in
    
    Scenario: User wants to create a new email template with title and content, then tries to create a new post with the template
        Given User is on the email template page
        When User clicks the "New Template" link
        And User fills in "Howdy" to "Title"
        And User fills in "This is a season's greeting." to "Content"
        And the User clicks the "Create Template" button
        Then a new email template should be created
        And User should be on the email template page
        Given User is on the new post pages
        When User clicks the "Templates list" link
        And User clicks the "Fill In" link for the first template
        Then User should be on the new post page
        And User fills in "test@exmample.org" to "Recipient"
        And the User clicks the "Send Post" button
        And the post should have the selected title and content