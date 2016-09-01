FactoryGirl.define do
  factory :valid_enrollment, class: 'Enrollment' do    
    association :valid_course, factory: :course
    association :valid_student, factory: :student    
    entry_at Date.today
  end

  factory :invalid_enrollment, class: 'Enrollment' do
    course  nil
    student nil
    entry_at   nil
  end

end
