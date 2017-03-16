class StudentCourse < ApplicationRecord
  belongs_to :course, optional:true
  belongs_to :student, optional:true
  belongs_to :status, optional:true
end
