class AddExamenToAsignaturas < ActiveRecord::Migration[5.1]
  def change
    add_column :asignaturas, :examen, :text
    add_column :asignaturas, :respuestas, :string
  end
end
