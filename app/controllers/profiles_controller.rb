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
    not_saved = Profile.import(path)
    message = 'Profiles imported successfully.'
    message += "except row #{not_saved.join(' ,')}." if not_saved.length>0
    FileUtils.rm(path)
	redirect_to root_url, notice: message
	
end

def get_talukas
  d = District.find_by_name(params[:name])
  @home_district = d.talukas
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
  @user = Profile.find(params[:id])
  
end


  # GET /users/new
  def new
    @user = Profile.new
    @home_district = District.find_by_name("NA")
    @home_talukas = @home_district.talukas
    @home_taluka="NA"
    @posting_district = @home_district
    @posting_talukas = @home_talukas
    @posting_taluka="NA"
   @url = profiles_path
  end

  # GET /uses/1/edit
  def edit
    @home_district = District.find_by_name(@user.home_district) rescue nil
    @home_district = District.find_by_name("NA") if @home_district.nil?
    @home_talukas = @home_district.talukas
    @home_taluka = @home_talukas.find_by_name(@user.home_taluka) rescue nil
    @home_taluka = "NA" if @home_taluka.nil?
    @posting_district = District.find_by_name(@user.posting_district) rescue nil
    @posting_district = District.find_by_name("NA") if @posting_district.nil?
    @posting_talukas = @posting_district.talukas
    @posting_taluka = @posting_talukas.find_by_name(@user.posting_taluka) rescue nil
    @posting_taluka = "NA" if @posting_taluka.nil?
    @url = profile_path(@user)
  end

  # POST /uses
  # POST /uses.json
  def create
    @user = Profile.new(user_params)
    @user.date_of_birth = string_to_date(params[:profile][:date_of_birth]) 
    @user.date_of_join_dept = string_to_date(params[:profile][:date_of_join_dept]) 
    @user.posting_date = string_to_date(params[:profile][:posting_date]) 
    respond_to do |format|
      if @user.save!
        format.html { redirect_to profiles_url, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    update_user_params = user_params
    update_user_params["date_of_birth"] = string_to_date(params[:profile][:date_of_birth]) 
    update_user_params["date_of_join_dept"] = string_to_date(params[:profile][:date_of_join_dept]) 
    update_user_params["posting_date"] = string_to_date(params[:profile][:posting_date]) 

    respond_to do |format|
      if @user.update(update_user_params)
        format.html { redirect_to profiles_url, notice: 'Profile was successfully updated.' }
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
      @user = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:profile).permit(:name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :imei_code, :gcm_api_key, :home_district, :posting_district, :email, :photo, :icard )
    end

end
