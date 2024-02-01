Given(/^User is on the new post page$/) do
    visit "/app/CastNXT/posts/new"
end

When("User fills in {string} with {string}") do |field, value|
    fill_in field, with: value
end
  
When("User attaches the file {string} to {string}") do |file_name, field|
    attach_file(field, Rails.root.join('spec', 'fixtures', file_name))
end

When("User clicks the {string} button") do |button|
    click_button button
end
  
Then("User should be on the show post page") do
    last_post_id = Post.last.id
    expect(page).to have_current_path("/app/CastNXT/posts/#{last_post_id}")
end