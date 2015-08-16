require 'rails_helper'

RSpec.describe Trackpoint, type: :model do
  let(:time) { Time.now }
  it { is_expected.to belong_to(:track) }
  it { is_expected.to validate_presence_of(:track_id) }
  it { is_expected.to validate_presence_of(:longitude) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:time) }
  it { is_expected.to validate_numericality_of(:longitude) }
  it { is_expected.to validate_numericality_of(:latitude) }
  it { is_expected.to validate_numericality_of(:elevation) }
  it { is_expected.to validate_numericality_of(:heart_rate) }

  it "should get plain factory working" do
    f = FactoryGirl.create(:trackpoint)
    g = FactoryGirl.create(:trackpoint)
    expect(f).to be_valid
    expect(g).to be_valid
  end

  it "to_s returns value" do
    f = FactoryGirl.create(:trackpoint, longitude: 50.111, latitude: 7.1234,
                            elevation: 88, time: time)
    expect("#{f}").to be == "[50.111,7.1234,88.0]@#{time.to_s(:iso8601)}"
  end

end
