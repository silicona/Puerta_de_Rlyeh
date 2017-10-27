class InscripcionesController < ApplicationController
  def create
  	@asignatura = Asignatura.find(params[:aula_id])
  	usuario_actual.inscribirse(@asignatura)
  	respond_to do |formato|
  		formato.html { redirect_to secretaria_path}
  		formato.js
  	end
  end

  def destroy
  	@asignatura = Inscripcion.find(params[:id]).aula
  	usuario_actual.abandonar(@asignatura)
  	respond_to do |formato|
  		formato.html { redirect_to secretaria_path }
  		formato.js
  	end
  end
end
