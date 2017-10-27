class AsignaturasController < ApplicationController

	before_action :usuario_accedido
	before_action :usuario_matriculado

	def examinar
		@asignatura = Asignatura.find_by(nombre: params[:nombre])
		@examen = @asignatura.examen.split(/\.\s/)
	end

	def calificar
		@inscripcion = Inscripcion.find_by(alumno_id: params[:alumno], aula_id: params[:aula])
		@usuario = Usuario.find(@inscripcion[:alumno_id])
		@asignatura = Asignatura.find(@inscripcion[:aula_id])

		examen = parametros_examen
		@nota = comprobar(@asignatura.respuestas, examen)
		#debugger
		if @inscripcion.update_attribute(:nota, @nota)
			#flash[:success] = "Has entregado tu examen"
			render "calificacion"
		else
			flash[:danger] = "Ha habido un error con tu examen. No se ha guardado tu nota."
			redirect_to ver_perfil(@usuario.nombre)

		end
	end

	private
		def usuario_matriculado
			unless usuario_actual.matriculado?
				flash[:danger] = "Completa tu matricula"
				redirect_to ver_perfil_path(usuario_actual.nombre)
			end
		end

		def parametros_examen
			unless params[:respuestas].nil?
				params.require(:respuestas).permit(:preg0, :preg1, :preg2, :preg3, :preg4,
																					 :preg5, :preg6, :preg7, :preg8, :preg9)
			end
		end

		def comprobar(respuestas, examen)
			resultado = 0
			unless examen.nil?
				array = respuestas.split(/\;\s/)
				10.times do |n|
					examen["preg#{n}"].nil? ? next : nil
					array[n] == examen["preg#{n}"] ? resultado += 1 : next
				end
			end
			return resultado
		end
				
end
