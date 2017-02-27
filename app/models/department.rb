class Department < ApplicationRecord
  belongs_to :user, optional:true
  has_many :course_departments
  has_many :courses, through: :course_departments
end