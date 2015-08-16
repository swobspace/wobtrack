require 'rails_helper'

RSpec.describe "Trackpoints", type: :feature do
  describe "GET /trackpoints" do
    let(:track) { FactoryGirl.create(:track) }
    it "visits trackpoints#index" do
      login_user
      pending "not yet finished"

      visit track_trackpoints_path(track)
      expect(current_path).to eq(track_trackpoints_path(track))
    end
  end
end
