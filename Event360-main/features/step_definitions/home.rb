Then("User should be redirected to the login page") do
    expect(current_path).to eq '/users'
    expect(page).to have_content "Logged Out Successfully"
    end
