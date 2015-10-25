require 'rails_helper'

RSpec.describe Api::Internal::RecipesController, type: :controller do
  describe "POST #create" do
    login_user

    it "responds successfully with an HTTP 201 status code" do
      post :create, recipe: {
        :style_id=>1,
        :name => "test",
        :hops=>[{id: 1, mass: 1, time: 1}],
        :grain_ids=>[2],
        :yeast_ids=>[3],
        :adjunct_ids=>[4]}

      expect(response).to have_http_status(201)
    end
  end
end
