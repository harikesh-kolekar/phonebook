class ForumsController < AdminController
  def index
  	respond_to do |format|
	    format.html
	    format.json { render json: ForumsDatatable.new(view_context) }
	end
  end

  def close
  	forum = Forum.find(params[:id])
  	forum.is_closed = true
  	if forum.save
  		@notice = "Forum closed successfully"
  	else
  		@notice = forum.errors.full_messages.join(', ')
  	end
  	redirect_to :back, notice:@notice
  end

  def approve
  	forum = Forum.find(params[:id])
  	forum.is_approved = true
  	if forum.save
  		@notice = "Forum approved successfully"
  	else
  		@notice = forum.errors.full_messages.join(', ')
  	end
  	redirect_to :back, notice:@notice
  end
end
