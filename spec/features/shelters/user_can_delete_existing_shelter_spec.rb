require 'rails_helper'

  RSpec.describe "Shelters index page", type: :feature do
    it "user can delete a shelter from the system" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                           address: "145 Hound Dog Lane",
                           city: "Denver",
                           state: "Colorado",
                           zipcode: "80209")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("New Best Friend Shelter")

    click_link("Delete Shelter")

    expect(current_path).to eq("/shelters")
    expect(page).not_to have_content("New Best Friend Shelter ")

  end
end
