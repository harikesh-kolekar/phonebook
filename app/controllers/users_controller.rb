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

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def edit
	@user = User.find(params[:id])
    @home_district = District.find_by_name(@user.home_district) rescue nil
    @home_district = District.find_by_name("NA") if @home_district.nil?
    @home_talukas = @home_district.talukas
    @home_taluka = @home_talukas.find_by_name(@user.home_taluka) rescue nil
    @home_taluka = "NA" if @home_taluka.nil?
    @posting_district = District.find_by_name(@user.posting_district) rescue nil
    @posting_district = District.find_by_name("NA") if @posting_district.nil?
    @posting_talukas = @posting_district.talukas
    @posting_taluka = @posting_talukas.find_by_name(@user.posting_taluka) rescue nil
    @posting_taluka = "NA" if @posting_taluka.nil?
    @url = user_path(@user)

  end

  def update
  	@user = User.find(params[:id])
    update_user_params = user_params
    update_user_params["date_of_birth"] = string_to_date(params[:user][:date_of_birth]) 
    update_user_params["date_of_join_dept"] = string_to_date(params[:user][:date_of_join_dept]) 
    update_user_params["posting_date"] = string_to_date(params[:user][:posting_date]) 

    respond_to do |format|
      if @user.update(update_user_params)
        format.html { redirect_to '/users/all', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_profile
    begin
      @user = User.find(params[:user_id])
      @user.add_to_profile
      redirect_to :back, notice: 'Added to profile'
    rescue Exception => e
      redirect_to :back, notice: 'Something went Wrong Please try again.'
    end

  end

  def updat_status
    
  	begin
	  	user = User.find_by_id(params[:user_id])
	  	user.approve_status = params[:status].to_i 
	  	user.save!
	  	if user.approve_status == 1 && user.gcm_api_key.present?
        user.approved_at = Time.now
        user.save!
	  		registration_ids = [user.gcm_api_key]
	  		notification = {body: user.name, title: "User is Approved"}
        data = {user_id: user.id,  notification_type: "user_approved"}
	  		response = $gcm.send(registration_ids, notification: notification, data: data)
	  		logger.info "+++++++++++++++++++++++++++++++++GSM send++++++++++++++++++++++++ "
	  		logger.info response
	  	elsif user.approve_status == 2 && user.gcm_api_key.present?
	  		registration_ids = [user.gcm_api_key]
	  		notification = {body: user.name, title: "User is Declined"} 
        data = {user_id: user.id,  notification_type: "user_declined"}
        response = $gcm.send(registration_ids, notification: notification, data: data)
	  		logger.info "+++++++++++++++++++++++++++++++++GSM send++++++++++++++++++++++++ "
	  		logger.info response
	  		user.reset_authentication_token!
	  	end
	  	redirect_to :back, notice: 'Status Updated'
	rescue 
		p e
		# e.message
		redirect_to :back, notice: 'Something went Wrong Please try again.'
	end
  end

    def user_params
      params.require(:user).permit(:name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :imei_code, :gcm_api_key, :home_district, :posting_district, :email, :photo, :icard )
    end

end
