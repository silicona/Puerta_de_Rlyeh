require 'rails_helper'

RSpec.describe "Rutas", type: :request do
  describe "GET /rutas" do
    it "Llega al root" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
