class Api::V1::ProfilesController < Api::V1::ApiController
	def index
		updated_date = Date.strptime(params[:update_at],"%d/%m/%Y %H:%M:%S:%L") - 10.second rescue nil
		if updated_date.blank?
			@profiles = User.paginate(:page => params[:page])
		else
			@profiles = User.where("updated_at>?",updated_date).paginate(:page => params[:page]) 
		end
	end
	
end
