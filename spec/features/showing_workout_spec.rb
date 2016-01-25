require 'rails_helper'

RSpec.feature "Showing Workout Feature" do

  before do
    @john = User.create!(first_name: "john", last_name: "Doe", email: "john@exapmle.com", password: "password")
    @sarah = User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@exapmle.com", password: "password")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Body bulding", workout_date: Date.today)
    @e2 = @sarah.exercises.create(duration_in_min: 30, workout: "Cardio bulding", workout_date: Date.today)


    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario "shows friends workout details" do
    visit "/"

    click_link "My Lounge"
    click_link @sarah.full_name

    expect(page).to have_content(@sarah.full_name + " Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")

  end
end
