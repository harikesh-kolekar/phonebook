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
	  	redirect_to :back, notice: 'Status Updated'
	rescue 
		# p e
		# e.message
		redirect_to :back, notice: 'Profile was successfully updated.'
	end
  end

end
