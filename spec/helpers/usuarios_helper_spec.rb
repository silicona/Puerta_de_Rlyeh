require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsuariosHelper. For example:
#
# describe UsuariosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsuariosHelper, type: :helper do

  describe "Creando un avatar" do
  	before do
  		@usuario = Usuario.create!(nombre: "Paquito", password: "p455w0rd", password_confirmation: "p455w0rd")

  		@otro_usuario = Usuario.create!(nombre: "Carlota", password: "p455w0rd", password_confirmation: "p455w0rd",
  													 			matriculado: true, email: "railsprueba1@gmail.com", 
  													 			ciudad: "MM", pais: "Catalonia", residente: false)

  		@tercer_hombre = Usuario.create!(nombre: "Compay", password: "p455w0rd", password_confirmation: "p455w0rd",
  													 			matriculado: true, email: "railsprueba@gmail.com", 
  													 			ciudad: "MM", pais: "Catalonia", #imagen: { AvatarUploader. "imagenes/compay/becario.jpg" },
  													 			residente: true, residencia: "individual")
  	end

  	it "Crea una imagen por defecto" do
  		expect(crear_avatar(@usuario)).to eq "avatar_prueba.jpg"
  	end

  	it "Crea una imagen de gravatar si no hay imagen" do
  		id_gravatar = Digest::MD5::hexdigest(@otro_usuario.email.downcase)
  		expect(crear_avatar(@otro_usuario)).to eq "https://secure.gravatar.com/avatar/#{id_gravatar}?s=150"
  	end

  	it "Crea una imagen personalizada si hay" do
  		@tercer_hombre.imagen.model[:imagen] = "imagenes/compay/becario.jpg"
      expect(crear_avatar(@tercer_hombre, medida: 50)).to eq @tercer_hombre.imagen
  	end

  end

end
