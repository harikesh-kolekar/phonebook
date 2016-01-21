class CreateProfilesTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :designation
      t.string :education
      t.string :phone_no
      t.string :mobile_no1,              null: false, default: ""
      t.string :mobile_no2
      t.string :email
      t.string :home_taluka_id
      t.date :date_of_birth
      t.date :date_of_join_dept
      t.date :posting_date
      t.string :present_post
      t.string :home_taluka,:default=>"NA"
      t.string :home_district,:default=>"NA"
      t.string :posting_district,:default=>"NA"
      t.string :posting_taluka,:default=>"NA"
      t.string :batch
      t.string :other_info
      t.attachment :photo
      t.attachment :icard

      t.timestamps null: false
    end
  end
end
