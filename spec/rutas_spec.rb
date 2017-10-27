require "rails_helper"

# Modificado config/environments/test.rb para default_url_options

RSpec.describe "Enrutando", type: :routing do
	fixtures :usuarios

	setup do
		@usuario = usuarios(:sara)
	end

	it "Acciones con file_fixture" do
		@file = file_fixture("usuarios.yml")
		@texto = "sara:
  nombre: sara
  password_digest: <%= Usuario.digest('p455w0rd') %>
  matriculado: true
  email: vertederonuclear@gmail.com
  ciudad: Madrid
  pais: Venezuela
  residente: true
  residencia: individual

shilum:
  nombre: shilum
  password_digest: <%= Usuario.digest('p455w0rd') %>
  matriculado: true
  imagen: 'becario.jpg'
  email: miemail@gmail.com
  ciudad: Medellin
  pais: Chiquitistán
  residente: false

clara:
  nombre: clara
  password_digest: <%= Usuario.digest('p455w0rd') %>

"
		expect(@file.read).to eq(@texto)
		expect(@file.size).to eq 496
	end 

	it "ver_perfil/Sara a usuarios#mostrar" do
		expect(:get => "/ver_perfil/sara").to route_to(
			controller: "usuarios",
			action: "mostrar",
			nombre: "sara"
		)
	end

	it "al perfil de usuario con path" do
		expect(:get => ver_perfil_path("sara")).to route_to(
			controller: "usuarios",
			action: "mostrar",
			nombre: "sara"
		)
		
		assert_equal @usuario.nombre, "sara"
		expect(:get => ver_perfil_path(@usuario.nombre)).to route_to(
			controller: "usuarios",
			action: "mostrar",
			nombre: "sara"
		)

	end

	it "enruta al perfil con url" do
		expect(:get => ver_perfil_url("sara")).to route_to(	controller: "usuarios",
																												action: "mostrar",
																												nombre: "sara" )

		expect(:get => ver_perfil_url(@usuario.nombre)).to route_to( controller: "usuarios",
																																 action: "mostrar",
																																 nombre: @usuario.nombre )
	end

	it "enruta a editar_perfil del usuario" do
		expect(:get => editar_perfil_url(@usuario.nombre)).to route_to( controller: "usuarios",
																																 		action: "editar",
																																 		nombre: @usuario.nombre )
	end

	it "llega al root y paginas fijas" do
		expect(:get => "/").to route_to(
			controller: "fijas",
			action: "inicio")

		expect(:get => colegio_path).to route_to(
			controller: "fijas",
			action: "colegio")

		expect(:get => lugares_path).to route_to(
			controller: "fijas",
			action: "lugares")
	end
end