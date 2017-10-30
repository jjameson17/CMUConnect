class CreateStudentGroupAssociations < ActiveRecord::Migration
  def change
    create_table :student_group_associations do |t|
      t.integer :student_group_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
