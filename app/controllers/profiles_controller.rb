class ProfilesController < AdminController


def index
  respond_to do |format|
    format.html
    format.json { render json: ProfilesDatatable.new(view_context) }
  end
end


end
