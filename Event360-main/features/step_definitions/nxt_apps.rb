require_relative 'step_helper'
World(StepHelper)

When(/User should see the manage applications page/) do
  expect(page).to have_content 'Application Management'
end

When "User creates an application {string} with valid parameters" do |name|
  # Create an application
  visit '/oauth/applications'
  click_link 'New Application'
  fill_in 'doorkeeper_application[name]', with: name
  fill_in 'doorkeeper_application[description]', with: 'Test application'
  fill_in 'doorkeeper_application[api_url]', with: 'http://example.com'
  fill_in 'doorkeeper_application[image_url]', with: 'http://example.com/image.png'
  fill_in 'doorkeeper_application[redirect_uri]', with: 'urn:ietf:wg:oauth:2.0:oob'
  fill_in 'doorkeeper_application[homepage_url]', with: 'http://example.com'
  click_button 'Submit'
end

When "User creates an application {string} with invalid parameters" do |name|
  # Create an application
  visit '/oauth/applications'
  click_link 'New Application'
  fill_in 'doorkeeper_application[name]', with: name
  fill_in 'doorkeeper_application[description]', with: 'Test application'
  fill_in 'doorkeeper_application[api_url]', with: 'http://example.com'
  fill_in 'doorkeeper_application[image_url]', with: 'http://example.com/image.png'
  fill_in 'doorkeeper_application[redirect_uri]', with: 'random text'
  fill_in 'doorkeeper_application[homepage_url]', with: 'http://example.com'
  click_button 'Submit'
end

When "User visits the application page {string}" do |name|
  # Visit the application page
  visit '/oauth/applications'
  within("table") do
    click_link name
  end
end

When "User edits the application {string} with {string} {string}" do |name, field, value|
  # Edit the application
  click_link "Edit"
  fill_in "doorkeeper_application[#{field}]", with: value
  click_button 'Submit'
end
