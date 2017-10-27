class Inscripcion < ApplicationRecord
	belongs_to :alumno, class_name: "Usuario"
	belongs_to :aula, class_name: "Asignatura"
end
