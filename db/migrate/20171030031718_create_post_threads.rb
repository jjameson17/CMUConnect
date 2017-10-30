class CreatePostThreads < ActiveRecord::Migration
  def change
    create_table :post_threads do |t|
      t.string :subject
      t.datetime :create_date

      t.timestamps null: false
    end
  end
end
