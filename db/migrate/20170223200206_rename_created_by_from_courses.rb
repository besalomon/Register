class RenameCreatedByFromCourses < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :created_by, :user_id
  end
end
