class AddIcardToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :icard
  end
end
