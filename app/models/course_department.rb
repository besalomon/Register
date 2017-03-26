class CourseDepartment < ApplicationRecord
  belongs_to :department, optional:true
  belongs_to :course, optional:true
end
