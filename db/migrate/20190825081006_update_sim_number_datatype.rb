class UpdateSimNumberDatatype < ActiveRecord::Migration
  def change
  	change_column :users, :sim_number1, :string
  	change_column :users, :sim_number2, :string
  end
end
