class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates :course, :student, :entry_at, presence: true
  validate :student_already_enrolled?, on: [:save, :create]

  private

  def student_already_enrolled?  	
    enrolled = Enrollment.where('student_id = ? AND course_id = ?', student, course)
    errors.add(:student, 'Aluno já inscrito no curso') unless enrolled.blank?
  end
end