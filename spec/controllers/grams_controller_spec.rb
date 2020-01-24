require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "grams#index action" do
    it "Index Page created herein" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
