require 'rails_helper'

RSpec.describe "Pets index page", type: :feature do
  it "user can delete a pet from index" do
    shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                         address: "145 Hound Dog Lane",
                         city: "Denver",
                         state: "Colorado",
                         zipcode: "80209")
    doggie_1 = Pet.create(name: "Lucille",
                          image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                          approx_age: 8,
                          sex: "female",
                          description: "Mean dog!",
                          shelter_id:shelter_1.id)

  visit "/pets"

  expect(page).to have_content("Lucille")

  click_button("Delete Pet")

  expect(current_path).to eq("/pets")
  expect(page).not_to have_content("Lucille")

  end
end
