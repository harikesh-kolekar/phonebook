class UsersDatatable
  delegate :params, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.send(params[:type]).count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

private

  def data
    users.map do |user|
      action = ""
    if user.approve_status == 2 || user.approve_status == 0
      action = "<a href='/users/#{user.id}/1'><i class='fa fa-thumbs-up'></i></a> "
    end
    if user.approve_status == 1 || user.approve_status == 0
      action += "<a href='/users/#{user.id}/2'><i class='fa fa-thumbs-down'></i></a> "
      # action += "<a href='/change_password?user_id=#{user.id}' data-remote='true'> <i class='fa fa-key'></i> </a>" if user.approve_status == 1
    end
    profile_user = ""
    if user.approve_status == 1
      profile_user = if user.profile
        "<a href='/profiles/#{user.profile.id}'> <i class='fa fa-eye'></i></a> "
      else
        "<a href='/users/#{user.id}/add_to_profile'> add to profile </a>"
      end
    end
      [
        user.name,
        user.email,
        user.mobile_nos,
        user.designation,
        user.posting_district,
        "<img src ='#{user.icard.url(:thumb)}' class='profile_image'>",
        "<img src ='#{user.photo.url(:thumb)}' class='profile_image'>",
        "<div class='action-glyphicon'>"+ profile_user +action+"\
        <a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/users/#{user.id}'>\
        <i class='fa fa-trash-o'></i></a>\
        <a  href='/users/#{user.id}/edit'>\
        <i class='fa fa-pencil'></i></a></div>"#+"<a href='/profiles/#{user.id}'> <i class='fa fa-eye'></i></a> <a  href='/profiles/#{user.id}/edit'><i class='fa fa-pencil'></i></a> </div>",
        # 
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.send(params[:type]).order(approved_at: :desc)#("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:search][:value].present?
      users = users.where("name like :search or email like :search or mobile_no1 like :search or mobile_no2 like :search or designation like :search", search: "%#{params[:search][:value]}%")
    end
    users
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[name email mobile_no1 designation name name]
    columns[params[:order]["0"][:column].to_i]
  end

  def sort_direction
    params[:order]["0"][:dir] == "desc" ? "desc" : "asc"
  end
end

