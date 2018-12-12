class Station
	attr_reader :name,
							:address,
							:fuel_types,
							:access_time,
							:distance

	def initialize(data)
		@name = data["station_name"]
		@address = data["street_address"]
		@fuel_types = data["fuel_type_code"]
		@distance = data["distance"]
		@access_time = data["access_days_time"]
	end

end