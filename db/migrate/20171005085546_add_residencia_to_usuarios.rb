class AddResidenciaToUsuarios < ActiveRecord::Migration[5.1]
  def change
  	add_column :usuarios, :residencia, :string
  end
end
