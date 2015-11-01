class DesignationsNotifications < ActiveRecord::Migration
  def change
    create_table :designations_notifications do |t|
      t.integer :designation_id
      t.integer :notification_id

      t.timestamps null: false
    end
  end
end
