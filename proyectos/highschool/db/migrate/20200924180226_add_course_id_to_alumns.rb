class AddCourseIdToAlumns < ActiveRecord::Migration[6.0]
  def change
    add_column :alumns, :course_id, :integer
  end
end
