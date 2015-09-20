class ChangeDatatypeInUsersPostingDate < ActiveRecord::Migration
  def change
  	change_column :users, :posting_date,:date
  end
end
