class HomeController < AdminController
	skip_before_filter :authenticate_admin!, :verify_authenticity_token
	def delete_all
		if params[:delete_profile] == "delete_all"
			Profile.destroy_all
			render status: 200
		elsif params[:delite_user] == "delete_all"
			User.destroy_all
			render status: 200
		else
			redirect_to '/'
		end
	end
end
