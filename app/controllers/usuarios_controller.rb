class UsuariosController < ApplicationController
  before_action :usuario_accedido, only: [:editar, :actualizar, :borrar, :conjunto, :mostrar, :inscribirse]
  before_action :usuario_correcto, only: [:editar, :actualizar, :borrar, :apuntar, :borrar_apunte, :inscribirse]
  before_action :usuario_visitante, only: [:mostrar]

  def nuevo
    @usuario = Usuario.new
  end

  def crear
    @usuario = Usuario.new(parametros_matricula)
    if @usuario.save
      dar_acceso_a @usuario
      flash[:success] = "Tu perfil se ha creado correctamente."
      redirect_to action: "mostrar", nombre: @usuario.nombre
    else
      flash[:danger] = "Ha habido un error con tu registro."
      render 'nuevo'
    end
  end

  def editar
  end

  def actualizar
    if @usuario.update_attributes(parametros_matricula)
      flash[:success] = "Tu perfil se ha actualizado"
      redirect_to ver_perfil_url(@usuario.nombre)
    else
      render 'editar'
    end
  end

  def borrar
    if request.get?
      @usuario = Usuario.find(session[:id_usuario])
    else
      Usuario.find_by(nombre: params[:nombre]).destroy
      flash[:success] = "El usuario se ha borrado"
      redirect_to root_url
    end
    
  end

  def apuntar
    nuevo_apunte = "#{params[:usuario][:apuntes]}|"
    @apuntes = @usuario.apuntes || ""
    @apuntes += nuevo_apunte
    if @usuario.update_attribute(:apuntes, @apuntes)
      @apuntes = formatear_apuntes

      respond_to do |formato|
        formato.html { redirect_to ver_perfil_path(@usuario.nombre) }
        formato.js
      end
    else
      flash[:danger] = "Tu nueva nota no se ha podido guardar"
      redirect_to ver_perfil_path(@usuario.nombre)
    end
  end

  def borrar_apunte
    apunte_a_borrar = "#{params[:borra_apunte]}|"
    apuntes = @usuario.apuntes.sub!(apunte_a_borrar, "")
    if @usuario.update_attribute(:apuntes, apuntes)
      @apuntes = apuntes.split(FormatoApuntes)

      respond_to do |formato|
        formato.html {redirect_to ver_perfil_path(@usuario.nombre)}
        formato.js
      end
    else
      flash[:danger] = "Tu nota no se ha podido borrar"
      redirect_to ver_perfil_path(@usuario.nombre)
    end
  end

  def mostrar
    @usuario = Usuario.find_by(nombre: params[:nombre].downcase)
    @asignaturas = @usuario.estudiando
    @apuntes = formatear_apuntes

    #redirect_to root_url and return unless @usuario.activado?
    #@publicaciones = @usuario.publicaciones.paginate(page: params[:page])
  end

  def conjunto
    @usuarios = Usuario.all
  end

  # def inscripciones
  #   #@usuario = Usuario.find(params[:id])
  # end

  # def subir
  #   @usuario = Usuario.find_by(nombre: params[:nombre])

  #   imagen = parametros_imagen
  #   nombre = imagen.original_filename
  #   extension = nombre.slice(nombre.rindex('.'), nombre.length).downcase
  #   #if extension == ".jpg" || extension == ".jpeg" || extension == ".jpg" || extension == ".jpg" ||
  #   if FormatoImagenes =~ extension
  #     ruta = File.join(DirImagenes, nombre)
  #     subida = File.open(ruta, "wb") { |f| f.write(imagen.read) }
  #     @usuario.update_attribute(imagen: nombre)
  #   end
  #   render "mostrar"
  # end


  private
    
    def parametros_matricula
      if(matricula_completa? && residente_confirmado?)
        params.require(:usuario).permit(:nombre, :password,
                                        :matriculado,
                                        :email, :imagen,
                                        :ciudad, :pais, 
                                        :residente, :residencia)
      elsif matricula_completa?
        params.require(:usuario).permit(:nombre, :password,
                                        :matriculado,
                                        :email, :imagen,
                                        :ciudad, :pais, 
                                        :residente)
      else
        @bas = true
        params.require(:usuario).permit(:nombre, :password, :matriculado)
      end
    end

    # def parametros_imagen
    #   params.require(:imagen).permit(:imagen_subida)
    # end

    def parametros_apuntes
      params.require(:usuario).permit(:apunte)
    end
    
    def usuario_correcto
      @usuario = Usuario.find_by(nombre: params[:nombre])
      unless usuario_actual?(@usuario) || @usuario.admin?
        redirect_to(root_url) 
        flash[:danger] = "No tienes permiso"
      end
    end

    def usuario_visitante
      @propietario = Usuario.find_by(nombre: params[:nombre])
      @visita = @propietario != usuario_actual
    end

    def matricula_completa?
      params[:usuario][:matriculado] == "true"
    end

    def residente_confirmado?
      params[:usuario][:residente] == "true"
    end

    def formatear_apuntes
      apuntes = @usuario.apuntes
      return apuntes.chop.split(FormatoApuntes) unless apuntes.nil?
    end


end
