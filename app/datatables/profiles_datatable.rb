class ProfilesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Profile.count,
      iTotalDisplayRecords: profiles.total_entries,
      aaData: data
    }
  end

private

  def data
    profiles.map do |profile|
      [
        h(profile.name),
        h(profile.email),
        h(profile.mobile_no),
        "",
        "",
      ]
    end
  end

  def profiles
    @profiles ||= fetch_profiles
  end

  def fetch_profiles
    profiles = Profile.order("#{sort_column} #{sort_direction}")
    profiles = profiles.page(page).per_page(per_page)
    if params[:sSearch].present?
      profiles = profiles.where("first_name like :search or email like :search or mobile_no like :search", search: "%#{params[:sSearch]}%")
    end
    profiles
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[first_name email mobile_no first_name first_name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

