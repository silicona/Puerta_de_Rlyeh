require 'test_helper'

class SesionesHelperTest < ActionView::TestCase

	setup do
		@usuario = usuarios(:sara)
		recuerda(@usuario)
	end

	test "usuario_actual devuelve el usuario correcto" do
		assert_equal @usuario, usuario_actual
		assert ha_accedido?
	end

	test "usuario_actual devuelve nil si digest_recuerda no concuerda" do
		@usuario.update_attribute(:digest_recuerda, Usuario.digest(Usuario.nuevo_token))
		assert_nil usuario_actual
	end
end