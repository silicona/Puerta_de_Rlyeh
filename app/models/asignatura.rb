class Asignatura < ApplicationRecord

	belongs_to :profesor
	has_many :incripciones, class_name: "Inscripcion",
													foreign_key: "aula_id",
													dependent: :destroy

  has_many :asistencia, through: :incripciones,
  											source: :alumno

  def examinara?(alumno)
  	asistencia.include?(alumno)
  end
end
