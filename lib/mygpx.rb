module MyGPX
  autoload :File, 'mygpx/file'
  autoload :Track, 'mygpx/track'
  autoload :Trackpoint, 'mygpx/trackpoint'

  def self.setup
    yield self
  end

end
