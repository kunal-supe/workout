require 'rails_helper'

RSpec.feature "Editing Exercise" do

  before do
    @owner = User.create(email: "john@exapmle.com", password: "password")

    @owner_exer = @owner.exercises.create!(duration_in_min: 45,
            workout: "cardio",
            workout_date: Date.today)
    login_as(@owner)
  end

  scenario "with valid inputs" do
    visit '/'

    click_link "My Lounge"
    link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
    find(link).click
    fill_in "Duration", with: 55
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(55)
    expect(page).not_to have_content(45)
  end
end
