Given("User is on the email template page") do
    visit "/app/CastNXT/email_templates"
end

Given("User is on the new post pages") do
    visit "/app/CastNXT/posts/new"
end
  
When("User clicks the {string} link") do |link_text|
    click_link(link_text)
end
  
When("User fills in {string} to {string}") do |value, field|
    fill_in field, with: value
end

When("the User clicks the {string} button") do |link_text|
    click_button(link_text)
end

When("User clicks the {string} link for the first template") do |link_text|
    # Assuming there is at least one email template in the database
    template = EmailTemplate.first
    click_link(link_text)
    fill_in "Title", with: template.title
    fill_in "Content", with: template.content

end

Then("a new email template should be created") do
    expect(EmailTemplate.count).to eq(1)
end

Then("User should be on the email template page") do
    expect(current_path).to eq("/app/CastNXT/email_templates")
end

Then("User should be on the new post page") do
    expect(current_path).to eq("/app/CastNXT/posts/new")
end

Then("the post should have the selected title and content") do
    expect(Post.last).not_to be_nil, "No post was created"
    expect(Post.last.title).to eq(EmailTemplate.first.title)
    expect(Post.last.content).to eq(EmailTemplate.first.content)
end