class CreateCourseRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :course_rooms do |t|
      t.integer :course_id
      t.integer :room_id
      t.datetime :lesson_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
