class Api::V1::ProfilesController < Api::V1::ApiController
	def index
		if params[:update_at].blank?
			@profiles = User.paginate(:page => params[:page]) 
		else
			@profiles = User.paginate(:page => params[:page])
		end
	end
	
end
