class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :register_number, uniqueness: true, presence: true
  
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments
end
