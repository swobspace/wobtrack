class Track < ActiveRecord::Base
  include TrackConcerns

  # -- associations
  belongs_to :user, class_name: "Wobauth::User"
  has_many :trackpoints, dependent: :destroy

  # -- configuration
  # -- validations and callbacks
  validates :name, :date, :user_id, presence: true
  
  def to_s
    "#{name}"
  end

end

