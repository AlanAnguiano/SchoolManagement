class Student < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_and_belongs_to_many :courses
  has_many :grades
end