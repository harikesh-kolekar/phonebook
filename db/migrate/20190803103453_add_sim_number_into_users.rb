class AddSimNumberIntoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :sim_number1, :integer
  	add_column :users, :sim_number2, :integer
  end
end
