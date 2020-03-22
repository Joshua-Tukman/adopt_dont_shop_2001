require 'rails_helper'

RSpec.describe "Individual pet profile page", type: :feature do
  it "can show pet's details" do
    shelter_1 = Shelter.create(name: "Canine Companions",
                               address: "765 Eldorado Blvd",
                               city: "Broomfield",
                               state: "Colorado",
                               zipcode: "80021")

    doggie_1 = Pet.create(name: "Lucille",
                          image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                          approx_age: 8,
                          sex: "female",
                          shelter_id:shelter_1.id,
                          description: "Cute, loveable pitbull mix!",
                          adoption_status: "Ready to be adopted!")
    visit "/pets/#{doggie_1.id}"

    expect(page).to have_content(doggie_1.name)
    expect(page).to have_css("img[src*='#{doggie_1.image}']")
    expect(page).to have_content(doggie_1.sex)
    expect(page).to have_content(doggie_1.approx_age)
    expect(page).to_not have_content("Frank")
    expect(page).to have_content(doggie_1.description)
    expect(page).to have_content(doggie_1.adoption_status)
  end
end

    # As a visitor
    # When I visit '/pets/:id'
    # Then I see the pet with that id including the pet's:
    # - image
    # - name
    # - description
    # - approximate age
    # - sex
    # - adoptable/pending adoption status
