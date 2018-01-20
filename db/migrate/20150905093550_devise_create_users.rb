class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


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
      t.string :present_post
      t.string :posting_taluka_id
      t.date :posting_date
      t.string :batch
      t.string :other_info
      t.string :imei_code
      t.text :gcm_api_key
      t.attachment :photo
      t.integer :approve_status,              null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :mobile_no1,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
