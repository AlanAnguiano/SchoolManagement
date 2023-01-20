class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :quarter_one, default: 'N/A'
      t.string :quarter_two, default: 'N/A'
      t.string :quarter_three, default: 'N/A'
      t.string :quarter_four, default: 'N/A'
      t.string :total, default: 'N/A'
      t.boolean :passed, default: false
      t.belongs_to :student
      
      t.timestamps
    end
  end
end
