class Api::V1::UsersController <  Api::V1::ApiController
	before_filter :valid_token, :except  => [:login, :create, :forgotpassword]

	def login
			if params['email'].blank? || params['password'].blank? 
				render :json => {:success => false, :message => "Missing parameters"} and return
			end
			@user = User.find_by( :email => params['email']) rescue nil
			if @user.blank?
				render :json => {:success => false, :message => "Incorrect email number or Password."} and return
			else
			  if @user.valid_password?(params['password'])
			  	if @user.approve_status == 1
					render :action => 'profile' and return
				else
					render :json => {:success => false, :message => "Your Account was not approved Please contact admin."} and return			  			
				end
			  else
				render :json => {:success => false, :message => "Incorrect email number or Password."} and return			  	
			  end
			end
	 end

  def userupdate
  	begin
  		params.tap { |h| h.delete(:password) }
  		check_params = validate_update_params()
		unless check_params[:success]
			render :json=>check_params and return  
		end
	    if @user.update(new_user_params)
		  	render :action => 'profile' and return
		else
			render :json => { :success => false, :message => "#{@user.errors.full_messages.join(', ')}!"} and return  	
		end
	rescue Exception => e
	 	render :json=>{:success => false, :message => "#{e.message}"} and return
	end
  end

	def create
		begin
			check_params = validate_params()
			unless check_params[:success]
				render :json=>check_params and return  
			end
			@user = User.find_by_email(params['user']['email'])
		    if @user 
		    elsif (!params['user']['mobile_no1'].blank? && User.get_user(params['user']['mobile_no1'])) 
		      @user = User.get_user(params['user']['mobile_no1'])
		    elsif (!params['user']['mobile_no2'].blank? && User.get_user(params['user']['mobile_no2']))
		      @user = User.get_user(params['user']['mobile_no2'])
		    end
			if @user.blank?
				@user = User.new(new_user_params)
				if @user.save
					render :json => {:success => true, :message => "Please contact admin to approve your account."} and return
				else
			 		render :json => { :success => false, :message => "#{@user.errors.full_messages.join(', ')}!"} and return  	
		  		end	
		  	elsif @user && !@user.gcm_api_key.blank?
				render :json => {:success => false, :message => "This User was already registored please contact admin."} and return
			elsif @user && @user.update!(new_user_params)
				render :json => {:success => true, :message => "Please contact admin to approve your account."} and return
			end
		rescue Exception => e
			render :json => {:success => false, :message => "#{e.message}"} and return
		end
  	end

  

	def logout
  		begin
  			@user.reset_authentication_token!
  			render :json => {:success => true, :message => "Successfully signout!"}
  		rescue Exception => e
  			render :json=>{:success=>false, :message => "#{e.message}"} and return
  		end
  	end

  

	def forgotpassword
		if params[:email].blank? 
			render :json => {:success => false, :message => "Missing parameters"} and return
		end
		@user = User.find_by(:email=>params[:email])
		if @user.present?
		  @user.send_reset_password_instructions
		  render :json => {:success => true, :message => "A mail with instruction to reset the password has been sent to the email account specified"} and return
		else
			render :json => {:success => true, :message => "User not Found"} and return  
		end
		
	end

	def resetpassword
		if  params[:password].blank? || params[:new_password].blank?  
			render :json => {:success => false, :message => "All fields are mandatory "} and return
		end
		if @user.valid_password?(params[:password]) 
			@user.password = params[:new_password]
			@user.reset_authentication_token! 
			if @user.save
				render :action => 'profile' and return
			else
				render :json => { :success => false, :message => "#{@user.errors.full_messages.join(', ')}!"}
			end
		else 
			render :json => { :success => false, :message => "Incorrect current password specified"} and return
		end
	end


	def profile
		render :action => 'profile'
	end


	protected
		def new_user_params
	      user = params.require(:user).permit(:name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :gcm_api_key, :home_district, :posting_district, :password, :email)
	      user["date_of_birth"] = string_to_date(params[:user][:date_of_birth]) 
		  user["date_of_join_dept"] = string_to_date(params[:user][:date_of_join_dept]) 
		  user["posting_date"] = string_to_date(params[:user][:posting_date]) 
		  user.decode_base64_photo(params['user']['photo_data'], params['user']['photo_content_type'], params['user']['photo_original_filename']) unless(params['user']['photo_data'].blank? || params['user']['photo_content_type'].blank? || params['user']['photo_original_filename'].blank?)
		  user.decode_base64_icard(params['user']['icard_data'], params['user']['icard_content_type'], params['user']['icard_original_filename']) unless(params['user']['icard_data'].blank? || params['user']['icard_content_type'].blank? || params['user']['icard_original_filename'].blank?)
		  return user
	    end

	    def validate_params
	    	req_params = []
	    	if params[:user]['mobile_no1'].blank? 
	    		req_params << 'mobile_no1'
	    	end
	    	if params[:user]['password'].blank? 
	    		req_params << 'password'
	    	end
	    	if params[:user]['email'].blank? 
	    		req_params << 'email'
	    	end
	    	if params[:user]['gcm_api_key'].blank? 
	    		req_params << 'gcm_api_key'
	    	end
	    	if params[:user]['name'].blank? 
	    		req_params << 'name'
	    	end
	    	if req_params.length > 0
				return {:success=>false, :message => req_params.join(', ')+" parameter required."} 
			else
				return {:success=>true}
			end
	    end

	    def validate_update_params
	    	req_params = []
	    	if params[:user]['mobile_no1'].blank? 
	    		req_params << 'mobile_no1'
	    	end
	    	
	    	if params[:user]['email'].blank? 
	    		req_params << 'email'
	    	end

	    	if params[:user]['name'].blank? 
	    		req_params << 'name'
	    	end

	    	if req_params.length > 0
				return {:success=>false, :message => req_params.join(', ')+" parameter required."} 
			else
				return {:success=>true}
			end
	    end
end
