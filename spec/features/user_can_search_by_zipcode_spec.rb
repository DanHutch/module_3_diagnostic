require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
			expect(page).to have_selector("input[value='Search by zip...']")
			fill_in :q, with: "80203"
			click_on("Locate")
			expect(current_path).to eq(search_path)

    end
  end
end


# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times