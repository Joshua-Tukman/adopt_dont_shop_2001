require 'rails_helper'

RSpec.describe "Shelters index page", type: :feature do
  it "can see all the names of shelters in system" do
    shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                         address: "145 Hound Dog Lane",
                         city: "Denver",
                         state: "Colorado",
                         zipcode: "80209")

    shelter_2 = Shelter.create(name: "Canine Companions",
                                address: "765 Eldorado Blvd",
                                city: "Broomfield",
                                state: "Colorado",
                                zipcode: "80021")
    visit "/shelters"

    expect(page).to have_link(shelter_1.name)

    expect(page).to have_link(shelter_2.name)

  end

end
