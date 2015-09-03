class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :description
      t.string :notification_type
      t.attachment :attachment

      t.timestamps null: false
    end
  end
end
