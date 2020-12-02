class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.date :finicio
      t.date :ffinal

      t.timestamps
    end
  end
end
