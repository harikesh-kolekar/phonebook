class GallariesController < AdminController
  before_action :set_gallary, only: [:show, :edit, :update, :destroy]
  layout "gallary"
  # GET /gallaries
  # GET /gallaries.json
  def index
    @gallaries = Gallary.all
    @gallary = Gallary.new
  end

  # GET /gallaries/1
  # GET /gallaries/1.json
  def show
    @gallary = Gallary.find(params[:id])
  end

  # GET /gallaries/new
  def new
    @gallary = Gallary.new
  end

  # GET /gallaries/1/edit
  def edit
  end

  # POST /gallaries
  # POST /gallaries.json
  def create
    @gallary = Gallary.new(gallary_params)

    respond_to do |format|
      if @gallary.save
        format.html { redirect_to gallaries_url, notice: 'Gallary was successfully created.' }
        format.json { render :show, status: :created, location: @gallary }
      else
        format.html { render :new }
        format.json { render json: @gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallaries/1
  # PATCH/PUT /gallaries/1.json
  def update
    respond_to do |format|
      if @gallary.update(gallary_params)
        format.html { redirect_to gallaries_url, notice: 'Gallary was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallary }
      else
        format.html { render :edit }
        format.json { render json: @gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallaries/1
  # DELETE /gallaries/1.json
  def destroy
    @gallary.destroy
    respond_to do |format|
      format.html { redirect_to gallaries_url, notice: 'Gallary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallary
      @gallary = Gallary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallary_params
      params.require(:gallary).permit(:photo, :title)
    end
end
