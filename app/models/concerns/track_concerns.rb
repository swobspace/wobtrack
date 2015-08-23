require 'mygpx'
module TrackConcerns
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def import_gpxtrack(options = {})
      options.symbolize_keys!
      file  = options.fetch(:file)     # raise error if option does not exist
      user  = options.fetch(:user)     # raise error if option does not exist
      index = options.fetch(:index, 0)
      gpx   = MyGPX::File.new(file: file)
      gpxtrack = gpx.tracks[index]
      ActiveRecord::Base.transaction  do
	track = Track.create!(
	  name: gpxtrack.name,
	  creator: gpx.creator,
	  date: gpx.time.to_date,
	  user_id: user.id
	)
	gpxtrack.trackpoints.each do |gpxtp|
	  track.add_gpxtrackpoint(gpxtp)
	end
      end
    end
  end

  def add_gpxtrackpoint(gpxtp)
    trackpoints.create(
      latitude: gpxtp.latitude, 
      longitude: gpxtp.longitude, 
      elevation: gpxtp.elevation, 
      time: gpxtp.time, 
      heart_rate: gpxtp.heartrate
    )
  end

end
