class DesignationsForums < ActiveRecord::Migration
  def change
  	create_table :designations_forums do |t|
      t.integer :designation_id
      t.integer :forum_id

      t.timestamps null: false
    end
  end
end
