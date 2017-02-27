class Course < ApplicationRecord
  belongs_to :user, optional:true
  has_many :student_courses
  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :course_departments
  has_many :departments, through: :course_departments
end
