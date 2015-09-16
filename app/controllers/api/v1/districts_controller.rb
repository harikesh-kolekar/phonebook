class Api::V1::DistrictsController < Api::V1::ApiController
	def index
		@districts = District.all
	end
end
