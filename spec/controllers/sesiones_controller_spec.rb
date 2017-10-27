require 'rails_helper'

RSpec.describe SesionesController, type: :controller do

  describe "Usuario accede" do
    it "Llega a la pantalla de acceso" do
      get :nuevo
      expect(response).to have_http_status(:success)
    end

  	it "Usuario accede a su perfil" do
  		post :crear, params: { sesiones: { nombre: "sara", password: "p455w0rd", recuerdame: "1" } }
  
  		expect(response).to have_http_status(:found)
      expect(esta_logeado?).to be true
      expect(response).to redirect_to ver_perfil_path(assigns(:usuario).nombre)
  	end
  end

end
