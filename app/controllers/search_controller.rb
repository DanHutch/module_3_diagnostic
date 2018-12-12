class SearchController < ApplicationController
	def index
		zip = params[:q]
		# @conn = Faraday.new(url: "https://developer.nrel.gov/api") do |faraday|
    # 	faraday.adapter Faraday.default_adapter
		# end
		response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&limit=10&api_key=#{ENV['API_KEY']}&radius=6.0&zip=#{zip}")

		stations = JSON.parse(response.body)["fuel_stations"]

		@stations = stations.map do |data|
			Station.new(data)
		end
 end
end
