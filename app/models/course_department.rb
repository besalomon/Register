class CourseDepartment < ApplicationRecord
  belongs_to :course, optional:true
  belongs_to :course_department, optional:true
end
