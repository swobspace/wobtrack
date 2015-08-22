module MyGPX
  class File
    attr_reader :xml, :meta, :tracks, :time, :creator, :version

    def initialize(options = {})
      options.symbolize_keys!
      file     = options.fetch(:file) # raise error if option does not exist
      @xml     = parse_xml(file)
      @meta    = parse_metadata(@xml)
      @time    = @meta.fetch('time', nil).to_time
      @creator = @xml.root.attributes.fetch('creator', '')
      @version = @xml.root.attributes.fetch('version', '')
      @tracks  = parse_tracks(@xml)
    end

    def to_s
      "#{time} #{@creator}"
    end

  private
    def parse_xml(file)
      unless ::File.readable?(file)
        raise "ERROR: gpx file #{file} is not readable or does not exist"
      end
      gpx = ::File.open(file)
      xml = Nokogiri::XML(gpx)
      if xml.root.name == "gpx"
        xml
      else
        raise "ERROR: wrong root node #{xml.root.name}"
      end
    end

    def parse_metadata(xml)
      meta = Hash.new
      xml.css("metadata").first.elements.each do |m|
        meta[m.node_name] = m.text
      end
      meta
    end

    def parse_tracks(xml)
      tracks = []
      xml.css("trk").each do |trk|
        track = MyGPX::Track.new(xml: trk, gpxfile: self)
        tracks << track
      end
      tracks
    end
  end
end
