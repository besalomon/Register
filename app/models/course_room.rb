class CourseRoom < ApplicationRecord
  belongs_to :course, optional:true
  belongs_to :room, optional:true
end
