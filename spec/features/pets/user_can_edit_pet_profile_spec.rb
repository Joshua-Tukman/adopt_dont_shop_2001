require 'rails_helper'

  RSpec.describe "Pet show page", type: :feature do
    it "user can update pet information in the system" do
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
    expect(page).to have_content(doggie_1.name)

    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{doggie_1.id}/edit")

    fill_in(:name, :with =>"Lucy")
    fill_in(:approx_age, :with => "8")
    fill_in(:sex, :with => "female")
    fill_in(:description, :with => "Loveable pit mix")
    fill_in(:image, :with => "https://i.pinimg.com/originals/7c/8a/ed/7c8aeda56e378273046d1fb0b1126f40.jpg")

    click_on "Update Pet"

    expect(current_path).to eq ("/pets/#{doggie_1.id}")
    expect(page).to have_content("Lucy")
    expect(page).to have_content("Loveable pit mix")
  end
end
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
