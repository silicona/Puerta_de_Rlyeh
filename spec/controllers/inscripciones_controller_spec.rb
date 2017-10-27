require 'rails_helper'

RSpec.describe InscripcionesController, type: :controller do

  fixtures :all

  before do
    acceso_describe usuarios(:shilum)
  end

  describe "Crea una nueva inscripcion" do
    it "deberia reenviar a secretaria" do
      get :create, params: { aula_id: asignaturas(:ciencia).id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "Destruye una inscripcion" do
    it "deberia reenviar a secretaria" do
      get :destroy, params: { id: inscripciones(:uno).id }
      expect(response).to have_http_status(:found)
    end
  end

end
