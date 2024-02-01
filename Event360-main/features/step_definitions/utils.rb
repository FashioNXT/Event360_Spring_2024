# Steps that have been reused or might be reused later

Given('User is logged in') do
    email = 'nxt@example.com'
    password = 'password'
    # Sign in as the non-admin user
    login email, password
    end

Given("User is on {string}") do |path|
    visit path
    end

When("User clicks on {string}") do |link|
    click_link link
    end

Then("User should see {string}") do |content|
    expect(page).to have_content content
    end

Then("User should be redirected to the user dashboard") do
    expect(current_path).to eq '/home'
    expect(page).to have_content "Events 360"
    end

Then("User should be redirected to the admin dashboard") do
    expect(current_path).to eq '/dashboard'
    expect(page).to have_content "Admin Dashboard"
    end

Given(/An administrator is signed in/) do
    # Create an admin user
    email = 'test@example.com'
    password = 'password'
    # Sign in as the admin user
    login email, password
    end

Given("User is on the home page") do
    visit home_url
    end

Given("User tries to navigate to {string}") do |path|
    visit path
    end
