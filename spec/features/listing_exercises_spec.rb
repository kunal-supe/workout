require 'rails_helper'

RSpec.feature "Listing Exercise" do

  before do
    @john = User.create!(first_name: "john", last_name: "Doe", email: "john@exapmle.com", password: "password")
    @sarah = User.create!(first_name: "Sarah", last_name: "Doe", email: "sarah@exapmle.com", password: "password")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Body bulding", workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 30, workout: "Cardio bulding", workout_date: Date.today)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario "shows users workout for last 7 days" do
    visit '/'

    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

  scenario "shows list of users friends" do
    visit "/"

    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link("Unfollow")
  end
end
