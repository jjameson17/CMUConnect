class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password
      t.string :home_state
      t.string :major
      t.string :school
      t.text :bio
      t.string :image_filename
      t.string :resume_filename
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
