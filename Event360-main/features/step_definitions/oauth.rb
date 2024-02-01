Given("User has an account with email {string} and password {string}") do |email, password|
  User.create!(name: 'Test', email: email, password_digest: BCrypt::Password.create(password), user_type: 'user')
end

Given("there is an application {string}") do |name|
  @oauth_application = NxtApps.create!(
    name: name,
    redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
    scopes: "read",
    api_url: "https://#{name}.example.com/api",
    homepage_url: "https://#{name}.example.com"
  )
end

When("User visits the OAuth authorization page") do
  visit oauth_authorization_path(client_id: @oauth_application.uid, redirect_uri: @oauth_application.redirect_uri, response_type: 'code', scope: 'read')
end

Then("User should see the authorization code") do
  expect(page).to have_content("Authorization code:")
end
