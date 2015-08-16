class Trackpoint < ActiveRecord::Base
  # -- associations
  belongs_to :track

  # -- configuration
  # -- validations and callbacks
  validates :longitude, :latitude, presence: true, numericality: true
  validates :time, :track_id, presence: true
  validates :elevation, :heart_rate, numericality: true, allow_blank: true

  def to_s
    "[#{longitude},#{latitude},#{elevation}]@#{time.to_s(:iso8601)}"
  end
end
