class ChangeCreatedByFromRoom < ActiveRecord::Migration[5.0]
  def change
    rename_column :rooms, :created_by, :user_id
  end
end
