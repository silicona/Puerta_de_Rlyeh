require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SesionesHelper. For example:
#
# describe SesionesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SesionesHelper, type: :helper do

	describe "Probando metodos auxiliars de sesiones" do
	  before do
	  	@usuario = Usuario.create(nombre: "Damian", password: "p455w0rd", password_confirmation: "p455w0rd")
	  	recuerda(@usuario)
	  end

	  it "usuario_actual devuelve el usuario correcto" do
	  	expect(@usuario).to eq usuario_actual
	  	expect(ha_accedido?).to be true
	  end

	  it "usuario_actual si el digest no concuerda" do
	  	@usuario.update_attribute(:digest_recuerda, Usuario.digest(Usuario.nuevo_token))
	  	expect(usuario_actual).to be nil
	  end
	end

end
