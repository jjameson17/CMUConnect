class AddStudentGroupsandWorkLocation < ActiveRecord::Migration
  def change
  	add_column :mentees, :work_location_preference, :integer
  	add_column :users, :student_group_category, :string
  	add_column :users, :work_location, :string
  end
end
