require "rails_helper"

RSpec.describe SfCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sf_cases").to route_to("sf_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/sf_cases/new").to route_to("sf_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/sf_cases/1").to route_to("sf_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sf_cases/1/edit").to route_to("sf_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sf_cases").to route_to("sf_cases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sf_cases/1").to route_to("sf_cases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sf_cases/1").to route_to("sf_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sf_cases/1").to route_to("sf_cases#destroy", :id => "1")
    end

  end
end
