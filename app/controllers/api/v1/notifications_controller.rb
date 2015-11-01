class Api::V1::NotificationsController < Api::V1::ApiController
  def index
  	@notifications = Notification.joins(:designations).where("designations.name='#{@user.designation}'").paginate(:page => params[:page]).order('id DESC')
  end
  def show
  	@notification = Notification.find(params[:id])
  end
end
