class AddStudentAssociationToCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :student, index: true
  end
end

