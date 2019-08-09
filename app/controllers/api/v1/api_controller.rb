class Api::V1::ApiController < ActionController::Base
	# before_filter :valid_token, :except  => [:login, :create, :forgotpassword]
	before_filter :valid_sim_number, :except  => [:create, :forgotpassword]
	before_filter :debug, :deleted_profile_ids
	rescue_from ::Exception, with: :error_occurred

	protected
		def deleted_profile_ids
			return if $get_deleted_record_ids
			p = Profile.create()
			$get_deleted_record_ids = Profile.get_deleted_record_ids
		    p.destroy
		end
		def string_to_date(date)
			Date.strptime(date,"%d/%m/%Y") rescue ''
	    end

		def debug
			print " ==== params = #{params.to_json} ===== "
		end

		def valid_imei_code
			if params['imei_code'].blank?
				render :json => {:success => false, :message => "Imei Code should not be blank!" } and return
			else
				@user = User.find_by(:imei_code=>params['imei_code']) rescue nil
				@user.update_attributes!(gcm_api_key: params['gcm_api_key'])if params['gcm_api_key'].present? && @user
				if @user.nil?
					render :json => {:success => false, :message => "Imei Code is not valid!", :registration_status => false } and return
				elsif @user.approve_status != 1
					render :json => {:success => false, :message => "Your Account was not approved Please contact admin.", :registration_status => true} and return			  			
				end
			end
		end

		def valid_sim_number
			if params['sim_number'].blank?
				render :json => {:success => false, :message => "Sim number should not be blank!" } and return
			else
				@user = User.where('sim_number1=? or sim_number2=?', params['sim_number'], params['sim_number']).first rescue nil
				@user.update_attributes!(gcm_api_key: params['gcm_api_key'])if params['gcm_api_key'].present? && @user
				if @user.nil?
					render :json => {:success => false, :message => "Sim number is not valid!", :registration_status => false } and return
				elsif @user.approve_status != 1
					render :json => {:success => false, :message => "Your Account was not approved Please contact admin.", :registration_status => true} and return			  			
				end
			end
		end


		def valid_token
			if params['authentication_token'].blank?
				render :json => {:success => false, :message => "Auth token should not be blank!" } and return
			else
				@user = User.find_by(:authentication_token=>params['authentication_token']) rescue nil
				if @user.nil?
					render :json => {:success => false, :message => "Auth token is not valid!" } and return
				end
			end
		end	

		def error_occurred(exception)
		  render json: {:success => false, :message => 'Something Went Rong', :dibug => exception.message}.to_json
		  return
		end
end
