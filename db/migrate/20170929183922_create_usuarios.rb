class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :password_digest

      t.timestamps
    end

    add_index :usuarios, :nombre, unique: true
  end
end
