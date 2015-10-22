class NotificationsController < AdminController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    respond_to do |format|
      format.html { @notification = Notification.new}
      format.json { render json: NotificationsDatatable.new(view_context) }
   end
    
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
    render 'edit'
  end

  # GET /notifications/1/edit
  def edit
    
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)
    @notification.notification_type = "Admin"
    respond_to do |format|
      if @notification.save!
        response = $gcm.send_with_notification_key($notification_key, {
            data: {id: @notification.id, title: @notification.title},
            collapse_key: "admin_notification"})
        p "+++++++++++++++++++++++++++++++++GSM send_with_notification_key++++++++++++++++++++++++ "
        p response
        logger.info "+++++++++++++++++++++++++++++++++GSM send_with_notification_key++++++++++++++++++++++++ "
        logger.info response

        format.html { redirect_to notifications_url, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to notifications_url, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:title, :description, :notification_type, :attachment)
    end
end
