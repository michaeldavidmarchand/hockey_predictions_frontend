require 'rails_helper'

RSpec.describe "Predictions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/predictions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/predictions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
