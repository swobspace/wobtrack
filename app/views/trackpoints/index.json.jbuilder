json.array!(@trackpoints) do |trackpoint|
  json.extract! trackpoint, :id, :longitude, :latitude, :elevation, :time, :track_id, :heart_rate
  json.url trackpoint_url(trackpoint, format: :json)
end
