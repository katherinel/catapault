require 'rails_helper'

RSpec.describe "Api::V1::Tags", type: :request do
  describe "GET /api_v1_tags" do
    it "works! (now write some real specs)" do
      get api_v1_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
