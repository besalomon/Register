class TeacherCourse < ApplicationRecord
  belongs_to :course, optional:true
  belongs_to :teacher, optional:true
end
