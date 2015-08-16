require 'rails_helper'

RSpec.describe "Tracks", type: :feature do
  describe "GET /tracks" do
    it "visits tracks#index" do
      login_user
      visit tracks_path
      expect(current_path).to eq(tracks_path)
    end
  end
end
