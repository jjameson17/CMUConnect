class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.integer :user_id
      t.string :company
      t.string :industry
      t.integer :graduation
      t.string :job_title

      t.timestamps null: false
    end
  end
end
