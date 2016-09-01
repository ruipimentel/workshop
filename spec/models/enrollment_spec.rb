require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:course) }
    it { should validate_presence_of(:student) }
    it { should validate_presence_of(:entry_at) }

    it 'the student can only enroll once in the course' do
      student = FactoryGirl.create(:valid_student)
      course  = FactoryGirl.create(:valid_course)

      Enrollment.create(student: student, course: course, entry_at: Date.today)

      enrollment = Enrollment.create(student: student, course: course, entry_at: Date.today) 

      expect(enrollment.errors.count).to eq(1)
    end
  end

  context 'relationships' do
  	it { should belong_to(:course) }
  	it { should belong_to(:student) }
  end

  
end
