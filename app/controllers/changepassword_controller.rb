class ChangepasswordController < AdminController
  def index
  end

  def edit
  	if params[:user_id].blank?
  		@url = '/change_password'
  	else
  		@url = "/users/#{params[:user_id]}/reset_password"
  	end
  end

  def update
  	
  	if params[:new_password] == params[:confirm_password]
	  	@admin = current_admin
	  	if @admin.valid_password?(params[:password])
	  		@admin.password = params[:new_password]
	  		if @admin.save
		  		@success = true
		  		flash[:success] = "Password updated successfully"
		  	else
		  		@success = false
		  		@message = @admin.errors.full_messages[0]
		  	end
	  	else
	  		@message = "Old password is not correct"
	  		@success = false
	  	end
	 else
	 	@success = false 
	 	@message = "New Password and Confirm Password must be same"
	 end
  end

  
end