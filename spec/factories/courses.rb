FactoryGirl.define do
  factory :valid_course, class: 'Course' do
    name        "Programação Web I"
    description "Vamos aprender HTML e CSS"
  end

  factory :invalid_course, class: 'Course' do
    name        nil
    description nil
  end
end