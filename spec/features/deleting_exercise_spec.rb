require 'rails_helper'

RSpec.feature "Deleting Exercise" do

  before do
    @owner = User.create(first_name: "john", last_name: "Doe", email: "john@exapmle.com", password: "password")

    @owner_exer = @owner.exercises.create!(duration_in_min: 45,
            workout: "cardio",
            workout_date: Date.today)
    login_as(@owner)
  end

  scenario "deleting exercises" do
    visit '/'

    click_link "My Lounge"
    link = "//a[contains(@href,'/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end

end
