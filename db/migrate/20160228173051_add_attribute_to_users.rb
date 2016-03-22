class AddAttributeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile_no, :interger
    User.all do |u|
    	u.update_attributes(mobile_no: u.mobile_no1)
    end
  end
end
