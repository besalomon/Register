class StudentCourse < ApplicationRecord
  belongs_to :course, optional:true
  belongs_to :student, optional:true
  has_one :status
end
