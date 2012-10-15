class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :project_id
      
      # make_voteable's Voting Columns
      t.integer :up_votes, :null => false, :default => 0
      t.integer :down_votes, :null => false, :default => 0

      t.timestamps
    end
  end
end
