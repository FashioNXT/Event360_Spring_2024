require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase

  test "register" do
    visit users_url
    click_on "Register"
    fill_in "registerName", with: "Test user"
    fill_in "registerEmail", with: "test@test.com"
    fill_in "registerPassword", with: "test"
    fill_in "registerRe-enterPassword", with: "test"
    click_on "submit"
    assert_selector "p", text: "Events 360"
  end

  test "login" do
    User.create(email: "test@test.com", password: "test")
    visit users_url
    click_on "Login"
    fill_in "registerEmail", with: "test@test.com"
    fill_in "loginPassword", with: "test"
    click_on "Sign in"
    assert_selector "p", text: "Events 360"
  end

end
