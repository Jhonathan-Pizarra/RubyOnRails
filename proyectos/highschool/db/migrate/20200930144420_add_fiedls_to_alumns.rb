class AddFiedlsToAlumns < ActiveRecord::Migration[6.0]
  def change
    add_column :alumns, :direccion, :string
    add_column :alumns, :sangre, :string
    add_column :alumns, :otro, :string
    add_column :alumns, :peso, :string
  end
end
