class AddDescriptionIntoForum < ActiveRecord::Migration
  def change
  	add_column :forums, :description, :string
  	add_column :forums, :closed_at, :datetime
  end
end
