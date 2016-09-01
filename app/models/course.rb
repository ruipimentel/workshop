class Course < ActiveRecord::Base
  validates :name, :description, presence: true
  
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments
end
