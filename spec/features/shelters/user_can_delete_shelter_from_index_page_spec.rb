require 'rails_helper'

  RSpec.describe "Shelters index page", type: :feature do
    it "user can delete a shelter from index" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                           address: "145 Hound Dog Lane",
                           city: "Denver",
                           state: "Colorado",
                           zipcode: "80209")

    visit "/shelters"

    expect(page).to have_content("New Best Friend Shelter")

    click_button("Delete Shelter")

    expect(current_path).to eq("/shelters")
    expect(page).not_to have_content("New Best Friend Shelter ")

  end
end

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter
