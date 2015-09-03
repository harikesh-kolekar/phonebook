class Api::V1::GallariesController < ApplicationController
  def index
  	@gallaries = Gallary.paginate(:page => params[:page])
  end
  def show
  	@gallary = Gallary.find(params[:id])
  end
end
