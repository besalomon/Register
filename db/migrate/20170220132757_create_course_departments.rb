class CreateCourseDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :course_departments do |t|
      t.integer :course_id
      t.integer :department_id
      t.string :name

      t.timestamps
    end
  end
end
