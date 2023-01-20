require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'is valid with valid attributes' do
    expect(Course.new(course_name: 'test')).to be_valid
  end

  it 'is not valid without valid attributes' do
    expect(Course.new).not_to be_valid
  end
end
