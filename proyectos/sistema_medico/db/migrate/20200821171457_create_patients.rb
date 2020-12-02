class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :ci
      t.string :name
      t.integer :age
      t.float :height
      t.string :tblood
      t.string :allergy
    end
  end
end
