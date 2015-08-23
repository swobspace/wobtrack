require 'rails_helper'

RSpec.describe Track, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:trackpoints) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:user_id) }

  it "should get plain factory working" do
    f = FactoryGirl.create(:track)
    g = FactoryGirl.create(:track)
    expect(f).to be_valid
    expect(g).to be_valid
  end

  it "to_s returns value" do
    f = FactoryGirl.create(:track, name: "SomeWhere")
    expect("#{f}").to be == "SomeWhere"
  end

  describe "::import_gpxtrack(file: file, index: 0, user: user)" do
    let(:file) { File.join( Rails.root, 'spec', 'fixtures', 'files', 'test.gpx') }
    let(:user) { FactoryGirl.create(:user) }

    it "increase track count by 1" do
      expect {
        Track.import_gpxtrack(file: file, index: 0, user: user)
      }.to change(Track, :count).by(1)
    end
    it "increase trackpoint count by 2" do
      expect {
        Track.import_gpxtrack(file: file, index: 0, user: user)
      }.to change(Trackpoint, :count).by(2)
    end
  end

end
