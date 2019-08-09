class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.text :question
      t.boolean :is_closed, default: false
      t.boolean :is_approved, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
