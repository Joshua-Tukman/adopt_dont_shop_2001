require 'rails_helper'

  RSpec.describe "shelter index page", type: :feature do
    it "user can create a new shelter in the system" do
      shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                           address: "145 Hound Dog Lane",
                           city: "Denver",
                           state: "Colorado",
                           zipcode: "80209")

    visit '/shelters'

    expect(page).to have_link("New Shelter")
    expect(page).to_not have_link("Lost Dog Warehouse")
    click_link("New Shelter")

    fill_in(:name, :with =>"Lost Dog Warehouse")
    fill_in(:address, :with => "2223 Forest Dr.")
    fill_in(:city, :with => "Boulder")
    fill_in(:state, :with => "Colorado")
    fill_in(:zipcode, :with => "80123")

    click_button("Create Shelter")

    expect(page).to have_link(shelter_1.name)
    expect(page).to have_link("Lost Dog Warehouse")

  end
end



# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
