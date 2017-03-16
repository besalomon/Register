class RemoveStatusFromStudentCourse < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_courses, :status, :string
  end
end
