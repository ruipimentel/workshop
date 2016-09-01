class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.date :entry_at

      t.timestamps null: false
    end
  end
end
