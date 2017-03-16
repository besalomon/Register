class Student < ApplicationRecord
  belongs_to :user, optional:true
  has_many :student_courses
  has_many :courses, through: :student_courses
end
