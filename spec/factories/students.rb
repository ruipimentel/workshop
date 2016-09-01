FactoryGirl.define do
  factory :valid_student, class: 'Student' do
    name            "João Paulo da Silva"
    register_number "12345678"
  end

  factory :invalid_student, class: 'Student' do
    name             nil
    register_number  nil
  end
end
