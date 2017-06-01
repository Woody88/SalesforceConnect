require 'rails_helper'

RSpec.describe "SfCases", type: :request do
  describe "GET /sf_cases" do
    it "works! (now write some real specs)" do
      get sf_cases_path
      expect(response).to have_http_status(200)
    end
  end
end
