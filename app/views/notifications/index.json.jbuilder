json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :description, :type, :attachment
  json.url notification_url(notification, format: :json)
end
