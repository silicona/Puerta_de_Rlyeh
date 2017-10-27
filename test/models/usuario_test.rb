require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

	setup do
		@usuario = Usuario.new( nombre: "Mara", 
														password: 'p455w0rd', 
														password_confirmation: 'p455w0rd', 
														email: "railsprueba1@gmail.com",
														pais: "Pernambuco",
														ciudad: "Madrid",
														imagen: "becario.jpg",
														matriculado: true,
														residente: true,
														admin: true,
														apuntes: "Las hojas en otoño son mejores.|La vida en si misma no es digna de la muerte.",
														residencia: "individual")

		@otro_usuario = Usuario.new(nombre: "Camel", 
																password: 'p455w0rd', 
																password_confirmation: 'p455w0rd', 
																matriculado: false) 
	end

	test "Deberia ser valido" do
		assert @usuario.valid?
		assert @usuario.save
	end

	test "Deberia tener nombre" do
		@usuario.nombre = "  "
		assert_not @usuario.valid?
		@usuario.nombre = ""
		assert_not @usuario.valid?
		assert_equal @usuario.errors.full_messages[0], "Nombre está en blanco"
	end

	test "La contraseña debe tener 8 caracteres y algunos numericos" do
		@usuario.password_confirmation = @usuario.password = "password"
		assert_not @usuario.valid?
		assert_equal @usuario.errors.full_messages[0], "Password debe contener letras y números"
	end

	test "La contraseña debe tener menos de 25 caracteres" do
		@usuario.password_confirmation = @usuario.password = "a" * 36
		assert_not @usuario.valid?
		assert @usuario.errors.full_messages, "es demasiado larga"
	end

	test "Nombre y contraseña no deben estar vacias al crear" do
		@usuario.password = @usuario.password_confirmation = ""
		assert_not @usuario.valid?
		@usuario.password = @usuario.password_confirmation = "     "
		assert_not @usuario.valid?
		assert @usuario.errors.full_messages[0], "Password está en blanco"
		@usuario.nombre = ""
		assert_not @usuario.valid?
		@usuario.nombre = "     "
		assert_not @usuario.valid?
		assert @usuario.errors.full_messages[0], "Nombre está en blanco"
	end

	test "El nombre deberia ser unico" do
		assert @usuario.valid?
		@usuario.save
		assert_equal "mara", @usuario.reload.nombre
		@otro_usuario.nombre = "Mara"
		assert_not @otro_usuario.valid?
		@dupli =  @usuario.dup
		assert_not @dupli.valid?
		@dupli.nombre = @usuario.nombre.upcase
		assert_not @dupli.valid?
		@otro_usuario.nombre = "mara"
		assert_not @otro_usuario.valid?
	end

	test "El nombre puede ser de varias palabras" do
		@usuario.nombre = "Sara Mindon"
		assert @usuario.valid?
		assert @usuario.save
		assert_equal "sara mindon", @usuario.reload.nombre
	end

	test "Usuario basico y con matricula completa" do

		assert_difference "Usuario.count", 1 do
			assert @otro_usuario.save
		end

		assert_difference "Usuario.count", 1 do
			assert @usuario.save
		end
	end

	test "El email se valida y se guarda en minusculas" do
		@usuario.email = "no_soy_valido"
		assert_not @usuario.valid?
		@usuario.email = "in/valido@gmail.com"
		assert_not @usuario.valid?
		@usuario.email = "in\va<lido@gmail.com"
		assert_not @usuario.valid?
		@usuario.email = "email_valido@dominio.comunitario.es"
		assert @usuario.valid?
		@usuario.email = "email.valido@dominio.com"
		assert @usuario.valid?
		@usuario.email = "eMAil@DominIO.es"
		assert @usuario.valid?

		@usuario.save		
		assert_equal "email@dominio.es", @usuario.reload.email
	end

	test "La ciudad y el pais no pueden tener más de 35 caracteres" do
		@usuario.ciudad = "a" * 36
		assert_not @usuario.valid?
		@usuario.pais = "a" * 36
		assert_not @usuario.valid?
	end

	# test "La matricula u la residencia deben estar activadas para guardar sus datos" do
	# 	otro = @usuario.dup
	# 	@usuario.matriculado = false
	# 	assert @usuario.save
	# 	assert_equal "", @usuario.reload.email
	# 	otro.residente = false
	# 	assert_not otro.valid?
	# end

end