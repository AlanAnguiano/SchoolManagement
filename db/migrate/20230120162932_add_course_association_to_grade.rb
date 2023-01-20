class AddCourseAssociationToGrade < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :course, index: true
  end
end
