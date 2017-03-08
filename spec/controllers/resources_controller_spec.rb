require 'rails_helper'

describe ResourcesController do
  let!(:resource) { Resource.create!(title: "Shoes", abstract: "They are really cool", teacher_only: false, teacher_id: 1) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the recent resources as @resources" do
      get :index
      expect(Resource.all).to include(resource)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end

  end

end
