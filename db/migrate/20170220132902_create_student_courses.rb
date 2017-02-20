class CreateStudentCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  end
end
