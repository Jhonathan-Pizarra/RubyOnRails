class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :administrador, :boolean, default: false
  end
end
