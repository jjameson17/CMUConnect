class AddMaxMatches < ActiveRecord::Migration
  def change
  	add_column :mentors, :max_matches, :boolean
  end
end
