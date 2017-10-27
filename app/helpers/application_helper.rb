module ApplicationHelper

	def enlace_a(texto, enlace, opciones = {})
		link_to(texto, enlace, opciones)
	end

	def volver_atras
		request.original_url
	end

	def titulo_por_defecto
		@titulo ||= action_name
	end

	def nominalizar(string)
		nombre = string.split.map { |i| i.capitalize }.join(' ')
	end

	def en_secretaria?
		/secretaria/ =~ request.original_url
	end

	def en_perfil?
		/ver_perfil/ =~ request.original_url
	end
	
end
