class Api::V1::ProfilesController < Api::V1::ApiController
	def index
		updated_date = Date.strptime(params[:update_at],"%d/%m/%Y %H:%M:%S:%L") - 10.second rescue nil
		if updated_date.blank?
			@profiles = User.profile.paginate(:page => params[:page])
		else
			@profiles = User.profile.where("updated_at>?",updated_date).paginate(:page => params[:page]) 
		end
		@notification_count = Notification.joins(:designations).where("designations.name='#{@user.designation}'").count
	end
	
	def deleted_profile
		
	end
	
end
