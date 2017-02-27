class AddLongAndShortDescriptionToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :long_description, :string
    add_column :courses, :short_description, :string
  end
end
