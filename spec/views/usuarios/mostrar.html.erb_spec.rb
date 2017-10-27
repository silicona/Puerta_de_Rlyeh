require 'rails_helper'

RSpec.describe "usuarios/mostrar.html.erb", type: :view do
	
	describe "Vista de usuario" do
		let(:usuario) do
			stub_model Usuario, id: 1, 
													nombre: "pepe", password:"p455w0rd", 
													matriculado: true, email: "email@valido.com", 
													pais: "Pernambuco", ciudad: "Barcelona", 
													residente: true, residencia: "compartida"																				
		end

	  it "Usuario ve su propio perfil" do
	  	@usuario = usuario
	  	render
	  	expect(rendered).to match /pepe/
	  	expect(rendered).to have_selector('h2', text: "Perfil de Pepe")
	  	expect(rendered).to have_selector('img.gravatar')
	  	expect(rendered).to have_selector('.datos li:first-of-type', text: "email@valido.com")
	  	expect(rendered).to have_selector('.asignaturas a[href="' + secretaria_path + '"]')
	  	expect(rendered).to have_selector('.cancelar')
	  end

	  it "Usuario ve perfil de otro (por desarrollar)" do
	  	@usuario = usuario
	  	usuario.nombre = "paca"
	  	usuario.id = 2
	  	@otro = usuario

	  	render

	  	expect(rendered).to match /paca/
	  end

	end
end
