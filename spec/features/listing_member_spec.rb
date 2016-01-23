require 'rails_helper'

RSpec.feature "Listing Members" do
  before do
    @john = User.create!(first_name: "John", last_name: "doe", email: "john@exapmle.com", password: "password")
    @sarah = User.create!(first_name: "sarah", last_name: "mathew",email: "sarah@exapmle.com", password: "password")
  end

  scenario "Shows a list of registered members" do
    visit '/'

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end
