class Api::V1::DesignationsController < Api::V1::ApiController
	def index
		@designations = Designation.all
	end
end
