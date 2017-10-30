class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :thread_id
      t.integer :user_id
      t.text :post
      t.datetime :create_date

      t.timestamps null: false
    end
  end
end
