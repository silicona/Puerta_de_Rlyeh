require 'rails_helper'

RSpec.describe Usuario, type: :model do
	context "Validación de usuario" do
	  before do
 			@usuario = Usuario.new( nombre: Faker::Hobbit.character, 
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

			@faker = Usuario.create!(nombre: Faker::DragonBall.character, 
															 password: 'p455w0rd', password_confirmation: 'p455w0rd',
															 matriculado: false)	  
	  end

		describe "Crear Usuario" do
		  it "Usuario válido" do
		  	expect(@usuario).to be_valid
		  	expect(@usuario.save).to be true
		  	#expect(@usuario.save).to (change{Usuario.all}).by(1)
		  end

		  it "Usuario básico" do
		  	expect(@faker).to be_valid
		  	expect(@faker.save).to be true
		  end
		end

		describe "Validando campos" do

		  it "Nombre: Presencia, longitud y único" do
		  	@usuario.nombre = "a" * 36
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Nombre es demasiado largo"
		  	@usuario.nombre = ""
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Nombre está en blanco"
		  	@usuario.nombre = "Lobo Lopez"
		  	@usuario.save
		  	@otro_usuario = @usuario.dup
		  	expect(@otro_usuario).to be_invalid
		  	expect(@otro_usuario.errors.full_messages).to include "Nombre ya está registrado"
		  end

		  it "Password: Presencia, longitud y confirmacion" do
		  	@usuario.password_confirmation = @usuario.password = "a" * 10
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Password debe contener letras y números"
		  	@usuario.password_confirmation = @usuario.password = "a3" * 13
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Password debe tener como máximo 25 caracteres"
		  	@usuario.password_confirmation = @usuario.password = "a3" * 2
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Password debe tener por lo menos 8 caracteres"
		  	@usuario.password_confirmation = "foo"
		  	@usuario.password = "bar"
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Password confirmation doesn't match Password"
		  	@usuario.password = "         "
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages[0]).to eq "Password está en blanco"
		  end		

		  it "Email: Presencia, longitud, formato y unico" do
		  	@usuario.email = ""
		  	expect(@usuario).to be_invalid
		  	@usuario.email = "j4"*13 + "@invalido.com"
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages).to include "Email es demasiado largo"
		  	@usuario.email = "j4j4j4j4_@invalido"
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages).to include "Email no es válido"
		  	@usuario.email = "Email1234@valido.com"
		  	expect(@usuario).to be_valid
		  	expect(@usuario.save).to be true
		  	expect(@usuario.reload.email).to eq "email1234@valido.com"

		  	@otro_usuario = @usuario.dup
		  	expect(@otro_usuario).to be_invalid
		  	expect(@otro_usuario.errors.full_messages).to include "Email ya está registrado"	 
		  end

		  it "Residencia: Presencia y longitud" do
		  	@usuario.residencia = ""
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages).to include "Residencia está en blanco"
		  	@usuario.residencia = "a" * 13
		  	expect(@usuario).to be_invalid
		  	expect(@usuario.errors.full_messages).to include "Residencia es demasiado largo"
		  end
		end

		describe "Autentificando al usuario" do
			it "autentificado? devuelve false si no hay digest" do
				expect(@faker.autentificado?('recuerda', Usuario.nuevo_token)).to be false
				expect(@faker.digest_recuerda).to be nil
			end
		end
	end
end


