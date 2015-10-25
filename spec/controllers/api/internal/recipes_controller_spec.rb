require 'rails_helper'

RSpec.describe Api::Internal::RecipesController, type: :controller do
  describe "POST #create" do
    login_user

    it "responds successfully with an HTTP 201 status code" do
      post :create
      expect(response).to be_success
      expect(response).to have_http_status(201)
    end
  end
end
