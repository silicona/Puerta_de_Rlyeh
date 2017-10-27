module SesionesHelper

	include ApplicationHelper

	def dar_acceso_a(usuario)
		session[:id_usuario] = usuario.id
	end

	def recuerda(usuario)
		usuario.recordar
		cookies.permanent.signed[:id_usuario] = usuario.id
		cookies.permanent[:token_recuerda] = usuario.token_recuerda
	end

	def usuario_actual?(usuario)
		usuario == usuario_actual
	end

	def usuario_actual
		if(id_usuario = session[:id_usuario])
			@usuario_actual ||= Usuario.find_by(id: id_usuario)
		elsif(id_usuario = cookies.signed[:id_usuario])
			#raise
			usuario = Usuario.find_by(id: id_usuario)
			if usuario && usuario.autentificado?(:recuerda, cookies[:token_recuerda])
				dar_acceso_a usuario
				@usuario_actual = usuario
			end
		end
	end

	def ha_accedido?
		!usuario_actual.nil?
	end

	def olvidar(usuario)
		usuario.olvidar if ha_accedido?
		cookies.delete(:id_usuario)
		cookies.delete(:token_recuerda)
		#cookies.delete(:token_chat)
	end

	def cerrar_acceso
		olvidar(usuario_actual)

		session.delete(:id_usuario)
		@usuario_actual = nil
	end

	def redirigir_a_URL_o(defecto)
		redirect_to(session[:url_deseada] || defecto)
		session.delete[:url_deseada]
	end

	def guardar_URL
		session[:url_deseada] = request.original_url if request.get?
	end
end
