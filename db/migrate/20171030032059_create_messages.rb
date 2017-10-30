class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :send_id
      t.integer :receive_id
      t.text :message_content
      t.datetime :create_date

      t.timestamps null: false
    end
  end
end
