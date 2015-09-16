class ProfilesController < AdminController
before_action :set_user, only: [:show, :edit, :update, :destroy]


def index
  respond_to do |format|
    format.html
    format.json { render json: ProfilesDatatable.new(view_context) }
  end
end

def upload_excel

	name = "#{Time.now.to_i}-#{params[:file].original_filename}"
    directory = "#{Rails.root}/public/xls_uploads/"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    not_saved = User.import(path)
    message = 'Profiles imported successfully.'
    message += "except row #{not_saved.join(' ,')}" unless not_saved.length>0
    FileUtils.rm(path)
	redirect_to root_url, notice: "Profiles imported."
	
end

# DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def show
  @user = User.find(params[:id])
  
end


  # GET /users/new
  def new
    @use = User.new
   
  end

  # GET /uses/1/edit
  def edit
    
  end

  # POST /uses
  # POST /uses.json
  def create
    @use = User.new(use_params)

    respond_to do |format|
      if @use.save!
        format.html { redirect_to profile_url, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @use }
      else
        format.html { render :new }
        format.json { render json: @use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_params
      params.require(:user).permit(:title, :description, :notification_type, :attachment)
    end

end
