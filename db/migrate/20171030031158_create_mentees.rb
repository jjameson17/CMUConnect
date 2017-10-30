class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.integer :user_id
      t.string :preferred_industry
      t.integer :expected_graduation

      t.timestamps null: false
    end
  end
end
