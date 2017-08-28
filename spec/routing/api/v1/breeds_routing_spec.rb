require "rails_helper"

RSpec.describe Api::V1::BreedsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/breeds").to route_to("api/v1/breeds#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/breeds/1").to route_to("api/v1/breeds#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/breeds").to route_to("api/v1/breeds#create")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/breeds/1").to route_to("api/v1/breeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/breeds/1").to route_to("api/v1/breeds#destroy", :id => "1")
    end

    it "routes to stats#index" do 
      expect(:get => "/api/v1/breeds/stats").to route_to("api/v1/stats#index", :resource => 'Breed')
    end
  end
end
