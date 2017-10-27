class AddMatriculaCompletaToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :email,   :string
    add_column :usuarios, :ciudad,  :string
    add_column :usuarios, :pais, 	  :string
    add_column :usuarios, :apuntes, :text
    add_column :usuarios, :imagen,  :string, default: "avatar_prueba.jpg"

    add_column :usuarios, :matriculado, :boolean, default: false
    add_column :usuarios, :residente, 	:boolean, default: false
    add_column :usuarios, :admin, 		:boolean, default: false

    add_column :usuarios, :digest_activacion, :string
    add_column :usuarios, :digest_recuerda,   :string
    add_column :usuarios, :digest_reseteo, 	  :string

    add_index :usuarios,  :email, unique: true
  end
end
