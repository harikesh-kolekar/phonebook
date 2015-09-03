class AddNameToGallaries < ActiveRecord::Migration
  def change
    add_column :gallaries, :name, :string
  end
end
