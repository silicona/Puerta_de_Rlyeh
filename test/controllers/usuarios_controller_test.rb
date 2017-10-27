require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest

	setup do
		@sara = usuarios(:sara)
		@paco = usuarios(:shilum)
	end

	test "Llegar a Nuevo usuario" do
		get registro_url
		assert_response 200
	end

	test "Crear usuario basico" do
		assert_difference "Usuario.count", 1 do
			post registro_url, params: { usuario: { nombre: "pancho", matriculado: false, residente: false,
																							password: "p455w0rd",	password_confirmation: "p455w0rd",
																							email: "", ciudad: "",	pais: "",
																							image: "" } }
		end

		assert esta_logeado?
		@usuario = assigns(:usuario)
		assert_redirected_to ver_perfil_path(@usuario.nombre)
		follow_redirect!

		assert_equal flash[:success], "Tu perfil se ha creado correctamente."
		assert_template "usuarios/mostrar"
		assert_select "h2", count: 1, text: "Perfil de " + nominalizar(@usuario.nombre)
		assert_select "article.col-md-3", count: 1, text: nominalizar(@usuario.nombre)
		#assert_select "img.gravatar", asset_path('avatar_prueba.jpg')
		#assert_equal "<img alt=\"" + @usuario.nombre + "\" class=\"gravatar\" src=\"assets/avatar_prueba.jpg\">", enlace_a_imagen("avatar_prueba.jpg")


	end

	test "Crear matricula con residencia" do
		assert_difference "Usuario.count", 1 do
			post registro_url, params: { usuario: { nombre: "pancho", 
																							password: "p455w0rd",	password_confirmation: "p455w0rd",
																							matriculado: true, 
																							email: "email@valido.com",
																							ciudad: "Pernambuco",	
																							pais: "Benidorm",
																							image: "retrato.jpg",
																							residente: true, 
																							residencia: "individual" } }
		end
		@usuario = assigns(:usuario)
		assert_equal [], @usuario.errors.full_messages
		assert_redirected_to ver_perfil_path(@usuario.nombre)
		follow_redirect!
		assert_template "usuarios/mostrar"
		assert flash[:success]
		assert_match nominalizar(@usuario.nombre), response.body
		#assert_equal "<img alt=\"" + @usuario.nombre + "\" class=\"gravatar\" src=\"assets/avatar_prueba.jpg\">", response.body
	end

	test "No guarda matricula sin matricula activada" do
		assert_difference "Usuario.count", 1 do
			post registro_url, params: { usuario: { nombre: "pancho", 
																							password: "p455w0rd",	password_confirmation: "p455w0rd",
																							matriculado: false, 
																							email: "email@valido.com",
																							ciudad: "Pernambuco",	
																							pais: "Benidorm",
																							image: "retrato.jpg",
																							residente: true, 
																							residencia: "individual" } }
		end
		@usuario = assigns(:usuario)
		assert_equal [], @usuario.errors.full_messages
		assert_not_nil @usuario.reload.id
		assert_not @usuario.reload.matriculado
		assert_not_equal "email@valido.com", @usuario.reload.email
		assert_nil @usuario.reload.email
		assert_not @usuario.reload.residente
		assert_nil @usuario.reload.residencia
	end

	test "No guarda residencia sin residente activado" do
		assert_difference "Usuario.count", 1 do
			post registro_url, params: { usuario: { nombre: "pancho", 
																							password: "p455w0rd",	password_confirmation: "p455w0rd",
																							matriculado: true, 
																							email: "email@valido.com",
																							ciudad: "Pernambuco",	
																							pais: "Benidorm",
																							image: "retrato.jpg",
																							residente: false, 
																							residencia: "individual" } }
		end
		@usuario = assigns(:usuario)
		assert_equal [], @usuario.errors.full_messages
		assert_not @usuario.reload.residente
		assert_nil @usuario.reload.residencia
	end

	test "No deberia acceder con informacion invalida" do
		get acceder_path
		post acceder_path, params: { sesiones: { nombre: @sara.nombre,
																						 password: 'p455' } }
		assert_response 200
		assert_template "sesiones/nuevo"
		assert flash[:danger]
	end

	test "Usuario registrado deberia acceder y ver su perfil" do
		get acceder_path
		assert_template "sesiones/nuevo"
		post acceder_path, params: { sesiones: { nombre: @sara.nombre,
																						 password: 'p455w0rd' } }
	  assert_redirected_to ver_perfil_path(@sara.nombre)
	  assert esta_logeado?
	  follow_redirect!
	  assert_template "usuarios/mostrar"
	  assert_select "a[href=?]", cancelar_path(@sara.nombre), count: 1
	end

	test "Sin acceso: redireccion al acceso" do
		get promocion_path
		assert_redirected_to acceder_path
		
		get editar_perfil_url(@sara.nombre)
		assert_redirected_to acceder_path
		
		get cancelar_path(@sara.nombre)
		assert_redirected_to acceder_path

		assert_no_difference "Usuario.count" do
			delete eliminar_url(@sara.nombre)
		end
		assert_redirected_to acceder_path
	end

	test "Usuario deberia editar su perfil" do
		dar_acceso_como(@sara)
		#assert_redirected_to ver_perfil_path(@sara.nombre)
		follow_redirect!
		assert_template "usuarios/mostrar"
		assert @sara.errors.full_messages, nil
		get editar_perfil_url(@sara.nombre)
		assert_template "usuarios/editar"
		assert_response 200

		patch actualizar_path, params: { usuario: { nombre: @sara.nombre,
																								password: 'p0p0p0p0' } }
		assert_redirected_to ver_perfil_path(@sara.nombre)
		follow_redirect!
		assert_template "usuarios/mostrar"
	end

	test "Usuario cierra sesion" do
		dar_acceso_como @sara
		assert esta_logeado?
		delete salir_path
		assert_redirected_to root_url
		assert flash[:success]
	end

	test "Usuario debe llegar a cancelar su cuenta" do
		dar_acceso_como @sara
		get cancelar_path(@sara.nombre)
		delete eliminar_url(@sara.nombre)
		assert_redirected_to root_url
		follow_redirect!
		assert flash[:success] = "El usuario se ha borrado"
		assert_template "fijas/inicio"
	end

	test "Usuario no deberia editar a otro" do
		dar_acceso_como @sara
		get editar_perfil_url(@paco.nombre)
		assert_redirected_to root_url
		assert_equal flash[:danger], "No tienes permiso"

	end

	test "Otro Usuario no deberia borrar a otro" do
		dar_acceso_como @sara
		get ver_perfil_path(@paco.nombre)
		assert_select "a[href=?]", cancelar_path(@paco.nombre), count: 0
		
		get cancelar_path(@paco.nombre)
		assert_redirected_to root_url
		assert_equal flash[:danger], "No tienes permiso"

		delete eliminar_path(@paco.nombre)
		assert_redirected_to root_url
		assert_equal flash[:danger], "No tienes permiso"
	end

end