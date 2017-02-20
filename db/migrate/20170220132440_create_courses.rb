class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :created_by
      t.integer :max_number
      t.integer :min_number
      t.boolean :series
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
