require 'rails_helper'

  RSpec.describe "shelter index page", type: :feature do
    it "user can access shelter update page from index" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                                 address: "145 Hound Dog Lane",
                                 city: "Denver",
                                 state: "Colorado",
                                 zipcode: "80209")

    visit "/shelters"
    expect(page).to have_content("New Best Friend Shelter")

    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in(:name, :with =>"Snoop Doggie's House of Dogs")
    fill_in(:address, :with => "134 Ruff Rd.")
    fill_in(:city, :with => "Compton")
    fill_in(:state, :with => "California")
    fill_in(:zipcode, :with => "90217")

    click_button ("Update Shelter")
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("134 Ruff Rd.")
    expect(page).not_to have_content("New Best Friend Shelter")

   end
end
