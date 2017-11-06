class AddPreferencestoMentees < ActiveRecord::Migration
  def change
  	add_column :mentees, :industry_preference, :integer
  	add_column :mentees, :home_state_preference, :integer
  	add_column :mentees, :major_preference, :integer
  	add_column :mentees, :student_group_preference, :integer
  end
end
