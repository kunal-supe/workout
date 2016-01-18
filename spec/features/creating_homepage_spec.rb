require 'rails_helper'

RSpec.feature "Creating Homepage" do

  scenario "should show homepage" do
    visit "/"

    expect(page).to have_link("Athletes Den")
    expect(page).to have_link("Home")
    expect(page).to have_content("Workout Lounge")
  end
end
