class AddUserIdToAlumns < ActiveRecord::Migration[6.0]
  def change
    add_column :alumns, :user_id, :integer
  end
end
