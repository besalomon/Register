class ChangeCreatedByToUserIdInDepartments < ActiveRecord::Migration[5.0]
  def change
    rename_column :departments, :created_by, :user_id
  end
end
