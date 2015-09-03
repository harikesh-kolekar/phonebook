class RenameGallariesTable < ActiveRecord::Migration
  def change
  	rename_column :gallaries, :name, :title
  end
end
