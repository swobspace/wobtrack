module MyGPX
  class Track
    attr_reader :xml, :name, :trackpoints

    def initialize(options = {})
      options.symbolize_keys!
      @xml  = options.fetch(:xml) # raise error if option does not exist
      @gpx  = options.fetch(:gpxfile) # raise error if option does not exist
      @name = _name(@xml)
      @trackpoints = parse_trackpoints(@xml)
    end

    def to_s
      @name
    end

  private

    def _name(xml)
      xml.css(">name").first.try(:text)
    end

    def parse_trackpoints(xml)
      trackpoints = []
      xml.css("trkpt").each do |pt|
        trkpt = MyGPX::Trackpoint.new(xml: pt, track: self)
        trackpoints << trkpt
      end
      trackpoints
    end
  end
end
