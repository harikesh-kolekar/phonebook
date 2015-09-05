class NotificationsDatatable
  delegate :params, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Notification.count,
      iTotalDisplayRecords: notifications.total_entries,
      aaData: data
    }
  end

private

  def data
    notifications.map do |notification|
      filename=notification.attachment.original_filename
      [
        notification.title,
        notification.description,
        notification.notification_type,
        filename,
        "",
      ]
    end
  end

  def notifications
    @notifications ||= fetch_notifications
  end

  def fetch_notifications
    notifications = Notification.order("#{sort_column} #{sort_direction}")
    notifications = notifications.page(page).per_page(per_page)
    if params[:search][:value].present?
      notifications = notifications.where("title like :search or attachment_file_name like :search or notification_type like :search ", search: "%#{params[:search][:value]}%")
    end
    notifications
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    columns = %w[title description notification_type attachment_file_name title]
    columns[params[:order]["0"][:column].to_i]
  end

  def sort_direction
    params[:order]["0"][:dir] == "desc" ? "desc" : "asc"
  end
end

