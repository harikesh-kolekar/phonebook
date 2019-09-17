class Api::V1::ForumsController < Api::V1::ApiController
  before_filter :valid_sim_number
  def index
  	if params[:is_closed].to_i == 1
  		@forums = Forum.approved.closed.joins(:designations).includes(user: :profile).where("designations.name='#{@user.designation}'").paginate(:page => params[:page]).order('id DESC').uniq
  	else
  		@forums = Forum.approved.active.joins(:designations).includes(user: :profile).where("designations.name='#{@user.designation}'").paginate(:page => params[:page]).order('id DESC').uniq
  	end
  end

  def show
  	@forum = Forum.approved.find(params[:id])
  	@forum_replays = @forum.forum_replays.paginate(:page => params[:page]).order('id DESC')
  end

  def create
  	valid_sim_number
  	validate_designation
    designations = params[:designation_ids]<<@user.designation_id
  	forum = @user.forums.build(question: params[:question], description: params[:description], designation_ids: designations.uniq)
  	if forum.save
  		render :json=>{:success => true}
  	else
  		render :json=>{:success => false, :message => forum.errors.full_messages.join(', ') } 
  	end
  end

  def update
  	forum = @user.forums.find(params[:id])
  	if forum.update(question: params[:question], is_closed: params[:is_closed], description: params[:description])
  		render :json=>{:success => true}
  	else
  		render :json=>{:success => false, :message => forum.errors.full_messages.join(', ') } 
  	end
  end

  def replay
	forum = Forum.active.find(params[:forum_id])
	forum_replays = forum.forum_replays.build(user_id: @user.id, answer: params[:answer])
	if forum_replays.save
	  render json: { success: true }
	else
  	  render :json=>{:success => false, :message => forum_replays.errors.full_messages.join(', ') } 
  	end
  end

  def validate_designation
  	render :json => {:success => false, :message => "You Dont have access to create forum", :registration_status => false } and return if @user.designation.blank? || @user.designation == "Others"
  end

  def close
    forum = @user.forums.find(params[:id])
    forum.is_closed = true
    if forum.save
      render :json=>{:success => true}
    else
      render :json=>{:success => false, :message => forum.errors.full_messages.join(', ') } 
    end
  end

end
