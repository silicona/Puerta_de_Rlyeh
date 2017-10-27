require 'test_helper'

class UsuariosHelperTest < ActionView::TestCase

	setup do
		@sara = usuarios(:sara)
		@shilum = usuarios(:shilum)
		@clara = usuarios(:clara)
	end

	test "crea un avatar para el usuario" do
		assert_equal crear_avatar(@clara), "avatar_prueba.jpg"
		gravatar_id = Digest::MD5::hexdigest(@sara.email.downcase)
		assert_equal crear_avatar(@sara), "https://secure.gravatar.com/avatar/#{gravatar_id}?s=150"
		assert_equal crear_avatar(@shilum), @shilum.imagen
	end
end