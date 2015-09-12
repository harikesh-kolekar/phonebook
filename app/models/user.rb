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
#  posting_date           :string(255)
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
#
# Indexes
#
#  index_users_on_mobile_no1            (mobile_no1) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: false, login: true}

   # belongs_to :home_taluka, :foreign_key => "home_taluka_id", :class_name=>"Taluka"
   # belongs_to :posting_taluka, :foreign_key => "posting_taluka_id", :class_name=>"Taluka"
   scope :all_users, -> { where('imei_code IS NOT NULL') }
   scope :approve_users, -> { where('imei_code IS NOT NULL and approve_status = 1') }
   scope :pending_users, -> { where('imei_code IS NOT NULL and approve_status = 0') }
   scope :declined_users, -> { where('imei_code IS NOT NULL and approve_status = 2') }



def self.import(file)
	workbook = RubyXL::Parser.parse(file)
	worksheet = workbook[0]
	data = worksheet.extract_data

  (1...data.length).each do |i|
  	next if User.where("mobile_no1=? or mobile_no2=? or mobile_no1=? or mobile_no2=?",data[i][2], data[i][2], data[i][3], data[i][3]).first
    u = User.new(:password=>"123456789")
    u.name = data[i][0]
    u.designation = data[i][1]
    if data[i][2].blank?
    	if data[i][3].blank?
    		next
    	else
    		u.mobile_no1 = data[i][3]
    	end
    else
    	u.mobile_no1 = data[i][2]
    	u.mobile_no2 = data[i][3]
    end
    u.phone_no = data[i][4]
    u.present_post = data[i][5]
    u.posting_district = data[i][6]
    u.posting_taluka = data[i][7]
    u.home_district = data[i][8]
    u.home_taluka = data[i][9]
    u.batch = data[i][10]
    u.date_of_join_dept = self.convert_string_to_date data[i][11]
    u.posting_date = self.convert_string_to_date data[i][12]
    u.date_of_birth = self.convert_string_to_date data[i][13]
    u.email = data[i][14]
    u.education = data[i][15]
    u.other_info = data[i][16]

    u.save
  end
end

	def self.convert_string_to_date(str)
		Date.strptime(str,"%d/%m/%Y") rescue ""
	end


	def email_required?
	  false
	end

	def email_changed?
	  false
	end

	  def login=(login)
	    @login = login
	  end

	  def login
	    @login || self.mobile_no1 || self.mobile_no2
	  end

	  def mobile_nos
	  	if self.mobile_no2.blank?
	  		return self.mobile_no1
	  	else
	  		return self.mobile_no1 + "/ " + self.mobile_no2
	  	end
	  end

end
