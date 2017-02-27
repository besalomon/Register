class Room < ApplicationRecord
  belongs_to :user
  has_many :course_rooms
  has_many :courses, through: :course_rooms
end
