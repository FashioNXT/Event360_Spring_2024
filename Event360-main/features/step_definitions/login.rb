require_relative 'step_helper'
World(StepHelper)

Given("User is on the login page") do
  visit users_path
end

When("User is registered with credentials {string} and {string}") do |email, password|
  create_user email, password
end

When("User enter their credentials {string} and {string}") do |email, password|
  enter_login_details email, password
end

When("User enter their credentials {string}, {string}, and {string}") do |name, email, password|
  enter_registration_details name, email, password
end

When("User select the {string} radio button") do |value|
  choose("user[user_type]", option: value)
end

When("User presses {string}") do |button|
  click_button button
end

Then("User should see an error message") do
  expect(page).to have_content "Incorrect email or password"
end

Then("the {string} radio button should be checked") do |id|
  expect(page).to have_checked_field(id)
end

