class AddShortNameToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :short_name, :string
  end
end
