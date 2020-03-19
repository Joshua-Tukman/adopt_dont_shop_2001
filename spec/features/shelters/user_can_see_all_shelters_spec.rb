require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all the names of shelters in system" do
    new_best_friend = Shelter.create(name: "New Best Friend Shelter",
                         address: "145 Hound Dog Lane",
                         city: "Denver",
                         state: "Colorado",
                         zipcode: "80209")

    canine_companions = Shelter.create(name: "Canine Companions",
                                address: "765 Eldorado Blvd",
                                city: "Broomfield",
                                state: "Colorado",
                                zipcode: "80021")
    visit "/shelters"

    expect(page).to have_content(new_best_friend.name)
    expect(page).to have_content(new_best_friend.address)
    expect(page).to have_content(new_best_friend.city)
    expect(page).to have_content(new_best_friend.state)
    expect(page).to have_content(new_best_friend.zipcode)
    expect(page).to have_content(canine_companions.name)
    expect(page).to have_content(canine_companions.address)
    expect(page).to have_content(canine_companions.city)
    expect(page).to have_content(canine_companions.state)
    expect(page).to have_content(canine_companions.zipcode)
  end
end
