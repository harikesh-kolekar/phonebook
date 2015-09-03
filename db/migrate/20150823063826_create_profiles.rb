class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :designation
      t.string :education
      t.string :phone_no
      t.string :mobile_no
      t.string :email
      t.string :home_district
      t.string :home_taluka
      t.date :date_of_birth
      t.date :date_of_join_dept
      t.string :present_post
      t.string :posting_district
      t.string :posting_taluka
      t.string :posting_date
      t.string :batch
      t.string :other_info

      t.timestamps null: false
    end
  end
end
