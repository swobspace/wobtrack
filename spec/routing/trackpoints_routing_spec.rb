require "rails_helper"

RSpec.describe TrackpointsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trackpoints").to route_to("trackpoints#index")
    end

    it "routes to #new" do
      expect(:get => "/trackpoints/new").to route_to("trackpoints#new")
    end

    it "routes to #show" do
      expect(:get => "/trackpoints/1").to route_to("trackpoints#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trackpoints/1/edit").to route_to("trackpoints#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trackpoints").to route_to("trackpoints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trackpoints/1").to route_to("trackpoints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trackpoints/1").to route_to("trackpoints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trackpoints/1").to route_to("trackpoints#destroy", :id => "1")
    end

  end
end
