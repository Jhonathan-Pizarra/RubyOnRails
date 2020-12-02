class AddAministradorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :administador, :boolean, default: false
    #defaul false pporque puede estar vacio, puede ser true tmb depende, si dejamos por defecto true, todos los usuarios que creamos serían admins

  end
end
