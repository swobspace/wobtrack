json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :description, :date, :user_id, :creator
  json.url track_url(track, format: :json)
end
