class ForumsDatatable
  delegate :params, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Forum.send(params[:type]).count,
      iTotalDisplayRecords: forums.total_entries,
      aaData: data
    }
  end

private

  def data
    forums.map do |forum|
      action = ""
      if forum.is_approved
        unless forum.is_closed
          action = "<a href='/forums/#{forum.id}/close'><i class='fa fa-thumbs-down'></i></a> "
        end
      else
        action = "<a href='/forums/#{forum.id}/approve'><i class='fa fa-thumbs-up'></i></a> "
      end
     
      [
        forum.question,
        forum.try(:user).try(:name) ,
        forum.try(:user).try(:mobile_nos) ,
        forum.try(:user).try(:designation) ,
        "<img src ='#{forum.try(:user).try(:photo).try(:url, :thumb) }' class='profile_image'>",
        "<div class='action-glyphicon'>"+action+"</div>"
      ]
    end
  end

  def forums
    @forums ||= fetch_forums
  end

  def fetch_forums
    forums = Forum.includes(:user).send(params[:type]).order(created_at: :desc)#("#{sort_column} #{sort_direction}")
    forums = forums.page(page).per_page(per_page)
    if params[:search][:value].present?
      forums = forums.where("question like :search ", search: "%#{params[:search][:value]}%")
    end
    forums
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[name question question question question question]
    columns[params[:order]["0"][:column].to_i]
  end

  def sort_direction
    params[:order]["0"][:dir] == "desc" ? "desc" : "asc"
  end
end

