class ProfilesDatatable
  delegate :params, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.profile.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

private

  def data
    users.map do |user|
      [
        user.name,
        user.email,
        user.mobile_nos,
        "<img src ='#{user.photo.url(:thumb)}' class='profile_image'>",
        "<div class='action-glyphicon'><a href='/profiles/#{user.id}'><i class='fa fa-eye'></i></a> <a  href='/profiles/#{user.id}/edit'><i class='fa fa-pencil'></i></a> \
        <a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/profiles/#{user.id}'><i class='fa fa-trash-o'></i></a> <div>",
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.profile.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:search][:value].present?
      users = users.where("name like :search or email like :search or mobile_no1 like :search or mobile_no2 like :search", search: "%#{params[:search][:value]}%")
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
    columns = %w[name email mobile_no1 name name]
    columns[params[:order]["0"][:column].to_i]
  end

  def sort_direction
    params[:order]["0"][:dir] == "desc" ? "desc" : "asc"
  end
end

