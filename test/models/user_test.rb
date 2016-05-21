# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  designation            :string(255)
#  education              :string(255)
#  phone_no               :string(255)
#  mobile_no1             :string(255)      default(""), not null
#  mobile_no2             :string(255)
#  home_taluka            :string(255)      default("NA")
#  date_of_birth          :date
#  date_of_join_dept      :date
#  present_post           :string(255)
#  posting_taluka         :string(255)      default("NA")
#  posting_date           :date(255)
#  batch                  :string(255)
#  other_info             :string(255)
#  imei_code              :string(255)
#  gcm_api_key            :text
#  photo_file_name        :string(255)
#  photo_content_type     :string(255)
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  approve_status         :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  home_district          :string(255)      default("NA")
#  posting_district       :string(255)      default("NA")
#  authentication_token   :string(255)
#  icard_file_name        :string(255)
#  icard_content_type     :string(255)
#  icard_file_size        :integer
#  icard_updated_at       :datetime
#  lat                    :string(255)
#  long                   :string(255)
#  mobile_no              :integer
#  approved_at            :datetime
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_mobile_no1            (mobile_no1) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
