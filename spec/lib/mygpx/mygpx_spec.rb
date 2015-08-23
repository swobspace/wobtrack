require 'rails_helper'
require 'mygpx'

RSpec.describe MyGPX do
  let(:file) { File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.gpx') }
  let(:gpx) { MyGPX::File.new(file: file) }
  let(:track) { gpx.tracks.first }

  describe "File" do
    it { expect(gpx).to be_kind_of(MyGPX::File) }
    it { expect(gpx.creator.to_s).to be == "handcrafted and color painted" }
    it { expect(gpx.time).to be == Time.utc('2015', '12', '31',  '23', '59', '59.0') }
    it { expect(gpx.tracks.count).to be == 1 }
  end
  describe "Track" do
    it { expect(track).to be_kind_of(MyGPX::Track) }
    it { expect(track.name).to be == "Testtrack" }
    it { expect(track.trackpoints.count).to be == 2 }
  end
  describe "Trackpoint" do
    let(:tp1) { track.trackpoints.first }
    let(:tp2) { track.trackpoints.last }
    it { expect(tp1).to be_kind_of(MyGPX::Trackpoint) }
    it { expect(tp2).to be_kind_of(MyGPX::Trackpoint) }
    it { expect(tp1.latitude).to be == 51.492096 }
    it { expect(tp1.longitude).to be == -0.141149 }
    it { expect(tp1.elevation).to be == 20.00 }
    it { expect(tp1.time).to be == Time.utc('2015', '12', '31',  '11', '00', '00.0') }
    it { expect(tp1.heartrate).to be == 99 }
    it { expect(tp2.latitude).to be == 51.482576 }
    it { expect(tp2.longitude).to be == 0.000000 }
    it { expect(tp2.elevation).to be == 15.00 }
    it { expect(tp2.time).to be == Time.utc('2015', '12', '31',  '11', '40', '55.0') }
    it { expect(tp2.heartrate).to be == 123 }
  end
end
