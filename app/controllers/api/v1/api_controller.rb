class Api::V1::ApiController < ActionController::Base
	# before_filter :valid_token, :except  => [:login, :create, :forgotpassword]
	before_filter :valid_imei_code, :except  => [:login, :create, :forgotpassword]
	before_filter :debug
	# rescue_from ::Exception, with: :error_occurred

	protected
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
				if @user.nil?
					render :json => {:success => false, :message => "Imei Code is not valid!" } and return
				elsif @user.approve_status != 1
					render :json => {:success => false, :message => "Your Account was not approved Please contact admin."} and return			  			
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
