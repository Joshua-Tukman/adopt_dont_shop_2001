require 'rails_helper'

  RSpec.describe "Shelters index page", type: :feature do
    it "user can create a new shelter in the system" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                           address: "145 Hound Dog Lane",
                           city: "Denver",
                           state: "Colorado",
                           zipcode: "80209")

    visit '/shelters'

    expect(page).to have_link("New Shelter")
    expect(page).to_not have_link("Lost Dog Warehouse")
    click_link "New Shelter"

    fill_in(:name, :with =>"Lost Doggie Warehouse")
    fill_in(:address, :with => "2223 Forest Dr.")
    fill_in(:city, :with => "Boulder")
    fill_in(:state, :with => "Colorado")
    fill_in(:zipcode, :with => "80123")

    click_button("Create Shelter")

    expect(page).to have_link(shelter_1.name)
    expect(page).to have_link("Lost Doggie Warehouse")

  end
end
