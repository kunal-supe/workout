require 'rails_helper'

RSpec.feature "Signin User" do

  before do
    @john = User.create!(email: "john@exapmle.com", password: "password")
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario do
    visit "/"

    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
