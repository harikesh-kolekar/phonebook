class Api::V1::ForumsController < Api::V1::ApiController
  def index
  	@forums = Forum.approved.active.joins(:designations).where("designations.name='#{@user.designation}'").paginate(:page => params[:page]).order('id DESC').uniq
  end
  def show
  	@forum = Forum.approved.active.find(params[:id])
  	@forum_replays = Forum.approved.active.find(params[:id]).forum_replays.paginate(:page => params[:page]).order('id DESC')
  end

  def create
  	valid_sim_number
  	validate_designation
  	forum = @user.forums.build(question: params[:question], designation_ids: params[:designation_ids]<<@user.designation_id)
  	if forum.save
  		render :json=>{:success => true}
  	else
  		render :json=>{:success => false, :message => forum.errors.full_messages.join(', ') } and return
  	end
  end

  def update
  	forum = @user.forums.active.find(params[:id])
  	if forum.update(question: params[:question], is_active: params[:is_active])
  		render :json=>{:success => true}
  	else
  		render :json=>{:success => false, :message => forum.errors.full_messages.join(', ') } and return
  	end
  end

  def replay
	  forum = @user.forums.active.find(params[:forum_id])
	  forum.forum_replays.build(user_id: @user.id, answer: params[:answer])
  end

  def validate_designation
  	render :json => {:success => false, :message => "You Dont have access to create forum", :registration_status => false } and return if @user.designation.blank? || @user.designation == "Others"
  end

end
