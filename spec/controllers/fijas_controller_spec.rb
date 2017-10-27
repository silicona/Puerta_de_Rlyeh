require 'rails_helper'


RSpec.describe FijasController, type: :controller do

	it "Llega al Inicio" do
		get :inicio
		expect(response).to have_http_status(:success)
	end

	it "Llega al Colegio" do
		get :colegio
		expect(response).to have_http_status(:success)
	end
end