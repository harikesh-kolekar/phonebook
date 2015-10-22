class UsersController < ApplicationController
  def index
  	respond_to do |format|
	    format.html
	    format.json { render json: UsersDatatable.new(view_context) }
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
	  		response = $gcm.add($key_name, "788763458333", $notification_key, [user.gcm_api_key])
	  		logger.info "+++++++++++++++++++++++++++++++++GSM ADD++++++++++++++++++++++++ "
	  		logger.info response
	  	end
	  	redirect_to :back, notice: 'Status Updated'
	rescue 
		# p e
		# e.message
		redirect_to :back, notice: 'Something went Wrong Please try again.'
	end
  end

end
