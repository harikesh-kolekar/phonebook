class Api::V1::UsersController <  Api::V1::ApiController
	before_filter :valid_token, :except  => [:login, :create, :forgotpassword]

	def login
			if params['mobile_number'].blank? || params['password'].blank? || params[:user]['imei_code'].blank?
				render :json => {:success => false, :message => "Missing parameters"} and return
			end
			@user = User.get_user( params['mobile_number']) rescue nil
			if @user.blank?
				render :json => {:success => false, :message => "Incorrect Mobile number or Password."} and return
			else
			  if @user.imei_code != params[:user]['imei_code']
			  	render :json => {:success => false, :message => "IMEI CODE not valid for this user."} and return			  	
			  elsif @user.valid_password?(params['password'])
			  	if @user.approve_status == 1
					render :action => 'profile' and return
				else
					render :json => {:success => false, :message => "Your Account was not approved Please contact admin."} and return			  			
				end
			  else
				render :json => {:success => false, :message => "Incorrect Mobile number or Password."} and return			  	
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
			@user = User.get_user(params['mobile_no1']) rescue nil
			if @user.nil?
				@user = User.new(new_user_params)
				# @user.dob = Date::strptime(params[:user][:dob_date], "%d/%m/%y") rescue nil
				if @user.save
					render :action => 'profile' and return
				else
			 		render :json => { :success => false, :message => "#{@user.errors.full_messages.join(', ')}!"} and return  	
		  		end	
		  	elsif @user && !@user.imei_code.blank?
				render :json => {:success => false, :message => "This User was already registored please contact admin."} and return
			else
				@user.imei_code = params[:user]['imei_code']
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
		end
		render :json => {:success => true, :message => "A mail with instruction to reset the password has been sent to the email account specified"} and return
	end

	def resetpassword
		print "----------------------params = #{params}------------------------"
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
		print "----------------------params = #{params}------------------------"
		
		render :action => 'profile'
	end


	protected
		def new_user_params
	      params.require(:user).permit(:name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :imei_code, :gcm_api_key, :home_district, :posting_district, :password, :email)
	    end

	    def validate_params
	    	req_params = []
	    	if params[:user]['mobile_no1'].blank? 
	    		req_params << 'mobile_no1'
	    	end
	    	if params[:user]['password'].blank? 
	    		req_params << 'password'
	    	end
	    	if params[:user]['imei_code'].blank? 
	    		req_params << 'imei_code'
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

