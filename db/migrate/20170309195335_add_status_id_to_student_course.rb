class AddStatusIdToStudentCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :student_courses, :status_id, :integer
  end
end
