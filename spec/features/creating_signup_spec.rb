require 'rails_helper'

RSpec.feature "Creating Signup" do

  scenario "A User can sign up with email & password" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "abc@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    visit '/'
    expect(page).to have_content("John Doe")

  end
end
