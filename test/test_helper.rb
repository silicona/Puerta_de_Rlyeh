require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
	# Incluir reporters en test
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include ApplicationHelper

  def esta_logeado?
  	!session[:id_usuario].nil?
  end

  def dar_acceso_como(usuario)
  	session[:id_usuario] = usuario.id
  end

end

class ActionDispatch::IntegrationTest

  include ApplicationHelper

  def esta_logeado?
    !session[:id_usuario].nil?
  end
  
	def dar_acceso_como(usuario, password: 'p455w0rd')
		post acceder_url, params: { sesiones: { nombre: usuario.nombre,
																						password: password } }
	end

  # def enlace_a_imagen(imagen)
  #   get image_tag(imagen)
  # end

end
