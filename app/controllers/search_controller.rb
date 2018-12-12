class SearchController < ApplicationController
	def index
		binding.pry
	
		zip = params[:q]
		@conn = Faraday.new(url: "https://developer.nrel.gov/api") do |faraday|
    	faraday.adapter Faraday.default_adapter
		end

		response = @conn.get("/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&limit=10&api_key=IpgwjA6Gg04x0YYk64LetQqAhJ1Dw6ezeOVeZpg0&format=JSON&radius=6.0&zip=#{zip}")

		@stations = JSON.parse(response.body, symbolize_names: true)
	binding.pry
 end
end
