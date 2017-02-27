class Teacher < ApplicationRecord
  has_one :user
  has_many :teacher_courses
  has_many :courses, through: :teacher_courses
end
