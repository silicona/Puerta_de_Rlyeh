module UsuariosHelper

	def crear_avatar(usuario, medida = {medida: 150})
		if tiene_imagen?(usuario)
			imagen = usuario.imagen
		elsif tiene_gravatar?(usuario)
			imagen = gravatar_para(usuario, medida)
		else
			imagen = "avatar_prueba.jpg"
		end
		#debugger
	end

	def tiene_imagen?(usuario)
		"avatar_prueba.jpg" != usuario.imagen.model[:imagen]
		#false
		#debugger
	end

	def tiene_gravatar?(usuario)
		usuario.matriculado
	end

	def gravatar_para(usuario, medida: 50)
		gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{medida}"
		#image_tag(gravatar_url, alt: usuario.nombre, class: "gravatar")
	end

	# def avatar_defecto(usuario)
	# 	avatar = "avatar_prueba.jpg"
	# 	image_tag(avatar, alt: usuario.nombre, class: "gravatar")
	# end

	def matriculado?
		@usuario.matriculado
	end

	def residente?
		@usuario.residente
	end
end
