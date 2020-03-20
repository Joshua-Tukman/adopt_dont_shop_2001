require 'rails_helper'

  RSpec.describe "shelter show page", type: :feature do
    it "user can update shelter information in the system" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                           address: "145 Hound Dog Lane",
                           city: "Denver",
                           state: "Colorado",
                           zipcode: "80209")

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("New Best Friend Shelter")

    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in(:name, :with =>"bob")
    fill_in(:address, :with => "jill")
    fill_in(:city, :with => "bobby")
    fill_in(:state, :with => "jilly")
    fill_in(:zipcode, :with => "bobtown")

    click_button ("Update Shelter")
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("bobtown")
    expect(page).not_to have_content("New Best Friend Shelter")

  end


end
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
