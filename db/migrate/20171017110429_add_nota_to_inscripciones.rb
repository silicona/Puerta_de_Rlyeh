class AddNotaToInscripciones < ActiveRecord::Migration[5.1]
  def change
    add_column :inscripciones, :nota, :integer
  end
end
