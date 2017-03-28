class User < ApplicationRecord
  has_secure_password
  belongs_to :role, optional:true
  has_one :student
  has_one :teacher
  has_many :courses
  has_many :departments
  has_many :rooms
end
