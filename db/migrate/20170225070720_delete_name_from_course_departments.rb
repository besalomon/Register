class DeleteNameFromCourseDepartments < ActiveRecord::Migration[5.0]
  def change
    remove_column :course_departments, :name, :string
  end
end
