class Api::V1::GallariesController < Api::V1::ApiController
  def index
  	@gallaries = Gallary.paginate(:page => params[:page])
  end
  def show
  	@gallary = Gallary.find(params[:id])
  end
end
