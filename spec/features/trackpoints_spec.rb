require 'rails_helper'

RSpec.describe "Trackpoints", type: :request do
  describe "GET /trackpoints" do
    it "works! (now write some real specs)" do
      get trackpoints_path
      expect(response).to have_http_status(200)
    end
  end
end
