class CreateForumReplays < ActiveRecord::Migration
  def change
    create_table :forum_replays do |t|
      t.text :answer
      t.integer :forum_id
      t.integer :user_id

      t.timestamps
    end
  end
end
