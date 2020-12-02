class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :titulo
      t.text :descripcion_corta
      t.text :descripcion_larga

      t.timestamps
    end
  end
end
