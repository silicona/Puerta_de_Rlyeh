class CreateProfesores < ActiveRecord::Migration[5.1]
  def change
    create_table :profesores do |t|
      t.string :nombre
      t.string :titulo
      t.string :departamento
      t.string :imagen
      t.text 	 :sinopsis
      t.text 	 :biografia

      t.timestamps
    end
  end
end
