class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :mentor_id
      t.integer :mentee_id
      t.boolean :active
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
