require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  context 'relationships' do
  	it { should have_many(:enrollments) }
    it { should have_many(:students) }
  end
end
