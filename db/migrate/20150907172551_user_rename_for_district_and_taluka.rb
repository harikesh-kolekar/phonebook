class UserRenameForDistrictAndTaluka < ActiveRecord::Migration
  def change
  	rename_column :users, :home_taluka_id, :home_taluka
  	rename_column :users, :posting_taluka_id, :posting_taluka
  	add_column :users, :home_district, :string,:default=>"NA"
  	add_column :users, :posting_district, :string,:default=>"NA"
  	change_column :users, :home_taluka,:string,:default=>"NA"
  	change_column :users, :posting_taluka,:string,:default=>"NA"
  end
end
