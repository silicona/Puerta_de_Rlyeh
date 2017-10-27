class SesionesController < ApplicationController

  def nuevo
  end

  def crear
  	@usuario = Usuario.find_by(nombre: params[:sesiones][:nombre].downcase)
  	if @usuario && @usuario.authenticate(params[:sesiones][:password])
  		dar_acceso_a @usuario
      params[:sesiones][:recuerdame] == '1' ? recuerda(@usuario) : olvidar(@usuario)
  		flash[:success] = "Bienvenido de nuevo, " + nominalizar(@usuario.nombre)
  		redirect_to ver_perfil_path(@usuario.nombre)
      #redirigir_a_URL_o ver_perfil_url(@usuario.nombre))
  	else
  		flash[:danger] = "El nombre o la contraseña no son correctos"
  		render "nuevo"
  	end
  end

  def destruir
  	cerrar_acceso
    flash[:success] = "Has cerrado correctamente tu sesión"
  	redirect_to root_url
  end
end
