require 'rails_helper'

feature "User can search by zipcode" do
	scenario "and see stations within 6 miles" do
		stub_search_api_calls
    visit "/"
    within(".navbar") do
			expect(page).to have_selector("input[value='Search by zip...']")
			fill_in :q, with: "80203"
			click_on("Locate")
			expect(current_path).to eq(search_path)
			expect(page.body).to have_content("Nearby Stations:")
			expect(page.body).to have_css(".stations")
			save_and_open_page
			within(".stations")
			expect(page).to have_css(".station", count: 2)
			expect(page).to have_css(".station-name")
			expect(page).to have_css(".station-address")
			expect(page).to have_css(".station-fuel-types")
			expect(page).to have_css(".station-distance")
			expect(page).to have_css(".station-access-time")

    end
  end
end
