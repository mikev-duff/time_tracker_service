require "spec_helper"

describe TimesheetEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/timesheet_entries").should route_to("timesheet_entries#index")
    end

    it "routes to #new" do
      get("/timesheet_entries/new").should route_to("timesheet_entries#new")
    end

    it "routes to #show" do
      get("/timesheet_entries/1").should route_to("timesheet_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/timesheet_entries/1/edit").should route_to("timesheet_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/timesheet_entries").should route_to("timesheet_entries#create")
    end

    it "routes to #update" do
      put("/timesheet_entries/1").should route_to("timesheet_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/timesheet_entries/1").should route_to("timesheet_entries#destroy", :id => "1")
    end

  end
end
