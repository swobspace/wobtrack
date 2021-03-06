module MyGPX
  class Trackpoint
    attr_reader :xml, :latlon, :elevation, :time, :heartrate

    def initialize(options = {})
      options.symbolize_keys!
      @xml       = options.fetch(:xml) # raise error if option does not exist
      @track     = options.fetch(:track) # raise error if option does not exist
      @latlon    = coordinates(@xml)
      @elevation = _elevation(@xml)
      @time      = _time(@xml)
      @heartrate = _hr(@xml)
    end

    def to_s
      sprintf("%10.6f\t%10.6f\t%7.2f\t%3d", latitude, longitude, elevation, heartrate) + "\t#{time}"
    end

    def latitude
      @latlon[0]
    end

    def longitude
      @latlon[1]
    end

    def coordinates(xml)
      [ xml['lat'].to_d, xml['lon'].to_d ]
    end

  private

    def _elevation(xml)
      xml.css("ele").first.content.to_d
    end

    def _time(xml)
      xml.css("time").first.content.to_time
    end

    def _hr(xml)
      xml.css("gpxtpx|hr").text.to_i
    end
  end
end
