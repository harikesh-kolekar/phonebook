class CreateTalukas < ActiveRecord::Migration
  def change
    create_table :talukas do |t|
      t.string :name
      t.integer :district_id

      t.timestamps null: false
    end
  end
end
