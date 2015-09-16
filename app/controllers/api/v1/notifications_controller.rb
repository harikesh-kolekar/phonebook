class Api::V1::NotificationsController < Api::V1::ApiController
  def index
  	@notifications = Notification.paginate(:page => params[:page])
  end
  def show
  	@notification = Notification.find(params[:id])
  end
end
