class User < ApplicationRecord
  has_secure_password
  belongs_to :role, optional:true
  belongs_to :student, optional:true
  belongs_to :teacher, optional:true
  has_many :courses
  has_many :departments
  has_many :rooms
end
