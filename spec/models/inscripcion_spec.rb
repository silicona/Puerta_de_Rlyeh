require 'rails_helper'

RSpec.describe Inscripcion, type: :model do

  fixtures :all
  
  describe "Se crea una inscripcion" do
  	before do
  	 	@inscripcion = Inscripcion.new(alumno_id: usuarios(:sara).id,
  	 																 aula_id: asignaturas(:ciencia).id)
  	end

  	it "Inscripcion válida" do
  	 	expect(@inscripcion).to be_valid
  	end

  	it "Inscripcion deberia tener alumno"

  	it "inscripcion deberia tener aula"
  	
  end
end
