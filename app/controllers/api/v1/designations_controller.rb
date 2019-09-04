class Api::V1::DesignationsController < Api::V1::ApiController
	before_filter :valid_sim_number, :except  => [:index]
	def index
		@designations = Designation.all
	end
end
