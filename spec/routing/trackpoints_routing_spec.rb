require "rails_helper"

RSpec.describe TrackpointsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tracks/99/trackpoints").to route_to("trackpoints#index", track_id: "99")
    end

    it "routes to #new" do
      expect(:get => "/tracks/99/trackpoints/new").to route_to("trackpoints#new", track_id: "99")
    end

    it "routes to #show" do
      expect(:get => "/tracks/99/trackpoints/1").to route_to("trackpoints#show", :id => "1", track_id: "99")
    end

    it "routes to #edit" do
      expect(:get => "/tracks/99/trackpoints/1/edit").to route_to("trackpoints#edit", :id => "1", track_id: "99")
    end

    it "routes to #create" do
      expect(:post => "/tracks/99/trackpoints").to route_to("trackpoints#create", track_id: "99")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tracks/99/trackpoints/1").to route_to("trackpoints#update", :id => "1", track_id: "99")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tracks/99/trackpoints/1").to route_to("trackpoints#update", :id => "1", track_id: "99")
    end

    it "routes to #destroy" do
      expect(:delete => "/tracks/99/trackpoints/1").to route_to("trackpoints#destroy", :id => "1", track_id: "99")
    end

  end
end
