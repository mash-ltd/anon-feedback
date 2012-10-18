class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :user_id
      t.text :content
      t.integer :project_id

      t.timestamps
    end
  end
end
