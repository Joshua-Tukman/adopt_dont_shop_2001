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

  end
end


# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
