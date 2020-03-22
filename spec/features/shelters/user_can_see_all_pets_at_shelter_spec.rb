require 'rails_helper'

RSpec.describe "Shelter page", type: :feature do
  it "can see all the pets that are in particular shelter" do
    shelter_1 = Shelter.create(name: "Canine Companions",
                               address: "765 Eldorado Blvd",
                               city: "Broomfield",
                               state: "Colorado",
                               zipcode: "80021")

    shelter_2 = Shelter.create(name: "Dog Town",
                               address: "2222 Burn St.",
                               city: "Broomfield",
                               state: "Colorado",
                               zipcode: "80021")

    doggie_1 = Pet.create(name: "Lucille",
                          image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                          approx_age: 8,
                          sex: "female",
                          shelter_id:shelter_1.id)

    doggie_2 = Pet.create(name: "Frank",
                         image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12130118/Golden-Retriever-Standing1-400x267.jpg",
                         approx_age: 4,
                         sex: "male",
                         shelter_id: shelter_2.id)

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(doggie_1.name)
    expect(page).to have_css("img[src*='#{doggie_1.image}']")
    expect(page).to have_content(doggie_1.sex)
    expect(page).to have_content(doggie_1.approx_age)
    expect(page).to_not have_content("Frank")
  end
end
