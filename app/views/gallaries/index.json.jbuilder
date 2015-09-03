json.array!(@gallaries) do |gallary|
  json.extract! gallary, :id
  json.url gallary_url(gallary, format: :json)
end
