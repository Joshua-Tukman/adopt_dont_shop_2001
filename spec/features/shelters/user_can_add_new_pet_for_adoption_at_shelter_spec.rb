require 'rails_helper'

  RSpec.describe "Shelter show page", type: :feature do
    it "user can add new pet for adoption" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                                 address: "145 Hound Dog Lane",
                                 city: "Denver",
                                 state: "Colorado",
                                 zipcode: "80209")
      doggie_1 = Pet.create(name: "Lucille",
                            image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                            approx_age: 8,
                            sex: "female",
                            shelter_id:shelter_1.id)

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in(:name, :with =>"Lucille")
    fill_in(:approx_age, :with => "8")
    fill_in(:sex, :with => "female")
    fill_in(:description, :with => "Super loveable pitbull mix.")
    fill_in(:image, :with => "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL")

    click_on "Add Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

  end
end

    # User Story 10, Shelter Pet Creation
    #
    # As a visitor
    # When I visit a Shelter Pets Index page
    # Then I see a link to add a new adoptable pet for that shelter "Create Pet"
    # When I click the link
    # I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
    # When I fill in the form with the pet's:
    # - image
    # - name
    # - description
    # - approximate age
    # - sex ('female' or 'male')
    # And I click the button "Create Pet"
    # Then a `POST` request is sent to '/shelters/:shelter_id/pets',
    # a new pet is created for that shelter,
    # that pet has a status of 'adoptable',
    # and I am redirected to the Shelter Pets Index page where I can see the new pet listed
