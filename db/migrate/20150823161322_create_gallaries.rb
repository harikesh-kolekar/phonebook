class CreateGallaries < ActiveRecord::Migration
  def change
    create_table :gallaries do |t|
      t.attachment :photo
      t.timestamps null: false
    end
  end
end
