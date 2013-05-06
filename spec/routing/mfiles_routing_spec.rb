require "spec_helper"

describe MfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/mfiles").should route_to("mfiles#index")
    end

    it "routes to #new" do
      get("/mfiles/new").should route_to("mfiles#new")
    end

    it "routes to #show" do
      get("/mfiles/1").should route_to("mfiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mfiles/1/edit").should route_to("mfiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mfiles").should route_to("mfiles#create")
    end

    it "routes to #update" do
      put("/mfiles/1").should route_to("mfiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mfiles/1").should route_to("mfiles#destroy", :id => "1")
    end

  end
end
