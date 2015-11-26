class UsersController < AdminController
  def index
  	respond_to do |format|
	    format.html
	    format.json { render json: UsersDatatable.new(view_context) }
	 end
  end

  def reset_password
  	@success = true 
  	begin
  		if params[:new_password] == params[:confirm_password]
		  	user = User.find_by_id(params[:user_id])
		  	user.password = params[:new_password]
		  	user.save!
		else
	  		@message = "New Password and Confirm Password must be same"
	  		@success = false
	  	end
  	rescue Exception => e
  		@success = false 
	 	@message = e.message
	 end
  end


  def updat_status
  	begin
	  	user = User.find_by_id(params[:user_id])
	  	user.approve_status = params[:status].to_i 
	  	user.save!
	  	if user.approve_status == 1 && user.gcm_api_key.present?
	  		registration_ids = [user.gcm_api_key]
	  		options = {data: {id: user.id, message: "User is Approved"}, collapse_key: "user_approved"}
	  		response = $gcm.send(registration_ids, options)
	  		logger.info "+++++++++++++++++++++++++++++++++GSM send++++++++++++++++++++++++ "
	  		logger.info response
	  	elsif user.approve_status == 2 && user.gcm_api_key.present?
	  		registration_ids = [user.gcm_api_key]
	  		options = {data: {id: user.id, message: "User is Declined"}, collapse_key: "user_declined"}
	  		response = $gcm.send(registration_ids, options)
	  		logger.info "+++++++++++++++++++++++++++++++++GSM send++++++++++++++++++++++++ "
	  		logger.info response
	  		user.reset_authentication_token!
	  	end
	  	redirect_to :back, notice: 'Status Updated'
	rescue 
		# p e
		# e.message
		redirect_to :back, notice: 'Something went Wrong Please try again.'
	end
  end

end
