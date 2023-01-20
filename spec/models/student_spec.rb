require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'is valid with valid attributes' do
    expect(Student.new(name: 'test', email:'email@gmail.com')).to be_valid
  end

  it 'is not valid without valid attributes' do
    expect(Student.new).not_to be_valid
  end
end
