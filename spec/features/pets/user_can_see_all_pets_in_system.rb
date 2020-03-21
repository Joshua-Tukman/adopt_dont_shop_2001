require 'rails_helper'

RSpec.describe "Pets index page", type: :feature do
  it "can see all the dogs in system" do
    doggie_1 = Dog.create(name: "Lucile",
                         image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                         approx_age: 8,
                         sex: "female",
                         shelter_name: "Canine Companions")

    shelter_1 = Shelter.create(name: "Canine Companions",
                                address: "765 Eldorado Blvd",
                                city: "Broomfield",
                                state: "Colorado",
                                zipcode: "80021")
    visit "/pets"

    expect(page).to have_link(shelter_1.name)

    expect(page).to have_link(shelter_2.name)

  end

end
