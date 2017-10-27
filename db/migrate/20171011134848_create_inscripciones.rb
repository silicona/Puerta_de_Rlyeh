class CreateInscripciones < ActiveRecord::Migration[5.1]
  def change
    create_table :inscripciones do |t|
      t.integer :alumno_id
      t.integer :aula_id

      t.timestamps
    end

    add_index :inscripciones, :alumno_id
    add_index :inscripciones, :aula_id
    add_index :inscripciones, [:alumno_id, :aula_id], unique: true
  end
end
