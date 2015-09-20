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
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_mobile_no1            (mobile_no1) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable#, :authentication_keys => {email: false, login: true}

   validates :mobile_no1, uniqueness: true, presence: true
   validates :mobile_no2, uniqueness: true, allow_blank: true
   validates :imei_code, uniqueness: true, allow_blank: true
   validates :gcm_api_key, uniqueness: true, allow_blank: true

   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/profile.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_attached_file :icard, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/i-card.png"
  validates_attachment_content_type :icard, content_type: /\Aimage\/.*\Z/

   # belongs_to :home_taluka, :foreign_key => "home_taluka_id", :class_name=>"Taluka"
   # belongs_to :posting_taluka, :foreign_key => "posting_taluka_id", :class_name=>"Taluka"
   scope :all_users, -> { where('gcm_api_key IS NOT NULL') }
   scope :approve_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 1') }
   scope :pending_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 0') }
   scope :declined_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 2') }



def self.import(file)
	workbook = RubyXL::Parser.parse(file)
	worksheet = workbook[0]
	data = worksheet.extract_data
  not_saved = []
  (1...data.length).each do |i|
    begin
      if((data[i][2].blank? && data[i][3].blank?) || data[i][14].blank?)
        not_saved<<i+1
        next
      end  
      u = User.find_by_email(data[i][14])
      if u 
      elsif (!data[i][2].blank? && get_user(data[i][2])) 
        u = get_user(data[i][2])
      elsif (!data[i][3].blank? && get_user(data[i][3]))
        u = get_user(data[i][3])
      else
        u = User.new(:password=>"123456789")
      end
      u.name = data[i][0]
      u.designation = data[i][1]
      if data[i][2].blank?
      		u.mobile_no1 = data[i][3]
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

      u.save!
    rescue Exception => e
      not_saved<<i+1
    end
  end
  return not_saved
end

	def self.convert_string_to_date(str)
		Date.strptime(str,"%d/%m/%Y") rescue ""
	end

  def decode_base64_photo(photo_data, content_type, original_filename )
      if photo_data && content_type && original_filename
        decoded_data = Base64.decode64(photo_data)

        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end

        data.content_type = content_type
        data.original_filename = File.basename(original_filename)

        self.photo = data
      end
  end

  def decode_base64_icard(photo_data, content_type, original_filename )
      if photo_data && content_type && original_filename
        decoded_data = Base64.decode64(photo_data)

        data = StringIO.new(decoded_data)
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end

        data.content_type = content_type
        data.original_filename = File.basename(original_filename)

        self.icard = data
      end
  end

	# def email_required?
	#   false
	# end

	# def email_changed?
	#   false
	# end

	#   def login=(login)
	#     @login = login
	#   end

	#   def login
	#     @login || self.mobile_no1 || self.mobile_no2
	#   end

	  def mobile_nos
	  	if self.mobile_no2.blank?
	  		return self.mobile_no1
	  	else
	  		return self.mobile_no1 + "/ " + self.mobile_no2
	  	end
	  end

    def self.get_user(mobile)
      User.where("mobile_no1=? or mobile_no2=? ",mobile, mobile).first
    end

end
