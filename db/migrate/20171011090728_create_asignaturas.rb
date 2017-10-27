class CreateAsignaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :asignaturas do |t|
    	t.string  :nombre, unique: true
    	t.integer :codigo, unique: true
    	t.string  :duracion
    	t.string  :modalidad
    	t.string  :edificio

    	t.text :bibliografia
    	t.text :descripcion
    	t.text :temario
        t.references :profesor, foreign_key: true

      t.timestamps
    end

    add_index :asignaturas, :codigo
  end
end
