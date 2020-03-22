require 'rails_helper'

  RSpec.describe "Shelters index page", type: :feature do
    it "user can delete a pet from the system" do
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

    visit "/pets/#{doggie_1.id}"

    expect(page).to have_content("Lucille")

    click_link("Delete Pet")

  end
end


# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
