require 'test_helper'

class EnrutarTest < ActionDispatch::IntegrationTest

	setup do
		@usuario = usuarios(:sara)
	end

	test "Enrutado a ver_perfil por nombre" do
		assert_routing "/ver_perfil/" + @usuario.nombre, controller: "usuarios",
																										 action: "mostrar",
																										 nombre: @usuario.nombre

		assert_routing ver_perfil_path(@usuario.nombre), controller: "usuarios",
																										 action: "mostrar",
																										 nombre: @usuario.nombre
	end

	test "ruta a editar_perfil" do
		assert_routing "editar_perfil/" + @usuario.nombre, controller: "usuarios",
																											 action: "editar",
																											 nombre: @usuario.nombre
	end


end