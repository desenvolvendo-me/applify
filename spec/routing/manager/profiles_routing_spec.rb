require "rails_helper"

RSpec.describe Manager::ProfilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/manager/profiles").to route_to("manager/profiles#index")
    end

    it "routes to #new" do
      expect(get: "/manager/profiles/new").to route_to("manager/profiles#new")
    end

    it "routes to #show" do
      expect(get: "/manager/profiles/1").to route_to("manager/profiles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/manager/profiles/1/edit").to route_to("manager/profiles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/manager/profiles").to route_to("manager/profiles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/manager/profiles/1").to route_to("manager/profiles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/manager/profiles/1").to route_to("manager/profiles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/manager/profiles/1").to route_to("manager/profiles#destroy", id: "1")
    end
  end
end
