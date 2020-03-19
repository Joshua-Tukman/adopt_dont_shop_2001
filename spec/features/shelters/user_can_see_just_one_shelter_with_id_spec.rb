require 'rails_helper'

RSpec.describe "A shelter's page", type: :feature do
  it "can see one shelter at a time including shelter info" do
    shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                         address: "145 Hound Dog Lane",
                         city: "Denver",
                         state: "Colorado",
                         zipcode: "80209")

  visit "/shelters/#{shelter_1.id}"

  expect(page).to have_content(shelter_1.name)
  expect(page).to have_content(shelter_1.address)
  expect(page).to have_content(shelter_1.city)
  expect(page).to have_content(shelter_1.state)
  expect(page).to have_content(shelter_1.zipcode)

  end
end
