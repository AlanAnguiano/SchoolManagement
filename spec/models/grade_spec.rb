require 'rails_helper'

RSpec.describe Grade, type: :model do
  before do
    @student = Student.create(name: 'test', email: 'test@test.com')
    @course = Course.create(course_name: 'test course')
  end
  
  it 'is valid with valid attributes' do
    expect(Grade.new(course_id: @course.id, student_id:@student.id)).to be_valid
  end

  it 'is not valid without course_id attribute' do
    expect(Grade.new(student_id:@student.id)).not_to be_valid
  end
end