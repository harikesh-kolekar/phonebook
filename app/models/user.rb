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
#  posting_date           :date
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
#  approved_at            :datetime
#  sim_number1            :string(255)
#  sim_number2            :string(255)
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
         :recoverable, :rememberable, :trackable, :token_authenticatable#, :authentication_keys => {email: false, login: true}
   # before_validation :set_mobile_no
   # validates :mobile_no, uniqueness: true, presence: true
   # validates :mobile_no2, uniqueness: true, allow_blank: true
   validates :sim_number1, uniqueness: true, allow_blank: true
   validates :sim_number2, uniqueness: true, allow_blank: true
   validates :gcm_api_key, uniqueness: true, allow_blank: true
   after_save :update_profile
   has_one :profile, dependent: :destroy
   has_many :forums

   has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:  ActionController::Base.helpers.asset_path("profile.png")
   validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
   has_attached_file :icard, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:  ActionController::Base.helpers.asset_path("i-card.png")
   validates_attachment_content_type :icard, content_type: /\Aimage\/.*\Z/

   # belongs_to :home_taluka, :foreign_key => "home_taluka_id", :class_name=>"Taluka"
   # belongs_to :posting_taluka, :foreign_key => "posting_taluka_id", :class_name=>"Taluka"
   scope :all_users, -> { where('gcm_api_key IS NOT NULL') }
   scope :approve_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 1') }
   scope :pending_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 0') }
   scope :declined_users, -> { where('gcm_api_key IS NOT NULL and approve_status = 2') }
   # scope :profile, -> { where('gcm_api_key IS NULL or (gcm_api_key IS NOT NULL and approve_status = 1) ') }
   # scope :profile, -> { where('gcm_api_key IS NULL') }

   def designation_id
    Designation.find_by(name: self.designation).try(:id)
   end

   def update_profile
     return if self.approve_status != 1
     profile = self.profile || find_profile 
     return if profile.blank?
     profile.update(get_profile_attr_from_user)
     update_profile_images(profile)
     
   end

   def add_to_profile
     profile = Profile.new(get_profile_attr_from_user)
     update_profile_images(profile)
   end

   def update_profile_images(profile)
     profile.photo = self.photo
     profile.icard = self.icard
     profile.save!
   end

   def get_profile_attr_from_user
      self.attributes.slice(
      "name",
      "designation",
      "education",
      "phone_no",
      "mobile_no1",
      "mobile_no2",
      "email",
      "home_taluka_id",
      "date_of_birth",
      "date_of_join_dept",
      "posting_date",
      "present_post",
      "home_taluka",
      "home_district",
      "posting_district",
      "posting_taluka",
      "batch",
      "other_info",
      ).merge(user_id: self.id)
   end

   def find_profile
      profile = Profile.where(user_id: nil).find_by_email(self.email)
      return profile if profile.present?
      profile = Profile.get_user(self.mobile_no1) if self.mobile_no1.present?
      return profile if profile.present?
      Profile.get_user(self.mobile_no2) if self.mobile_no2.present?
   end

   # after_save :add_gcm_redistration_id_to_notification_key
def  set_mobile_no
  self.mobile_no = self.mobile_no1
end

def self.profile
  Profile.all
end

def self.import(file)
	workbook = RubyXL::Parser.parse(file)
	worksheet = workbook[0]
	data = worksheet.extract_data
  not_saved = []
  (1...data.length).each do |i|
    begin
      if(data[i][2].to_s.blank? && data[i][3].to_s.blank? && data[i][4].to_s.blank? && data[i][1].to_s.blank? && data[i][5].to_s.blank? && data[i][6].to_s.blank? && data[i][7].to_s.blank? && data[i][8].to_s.blank? )
        next
      end
      if(data[i][2].to_s.blank? && data[i][3].to_s.blank? && data[i][4].to_s.blank?)
        not_saved<<i+1
        next
      end  
      u = User.find_by_email(data[i][4].to_s)
      if u 
      elsif (!data[i][2].to_s.blank? && get_user(data[i][2].to_s)) 
        u = get_user(data[i][2].to_s)
      elsif (!data[i][3].to_s.blank? && get_user(data[i][3].to_s))
        u = get_user(data[i][3].to_s)
      else
        u = User.new(:password=>"123456789")
      end
      u.name = data[i][0].to_s
      u.designation = data[i][1].to_s
      if data[i][2].to_s.blank?
      		u.mobile_no1 = data[i][3].to_s
      else
      	u.mobile_no1 = data[i][2].to_s
      	u.mobile_no2 = data[i][3].to_s
      end
      u.email = data[i][4].to_s
      u.posting_district = data[i][5].to_s
      u.home_district = data[i][6].to_s
      u.date_of_birth = self.convert_string_to_date data[i][7].to_s
      u.other_info = data[i][8].to_s

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

	def email_required?
	  false
	end

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
    def remove_gcm_key()
      $gcm
    end

    def add_gcm_redistration_id_to_notification_key
      if self.approve_status == 1 && (self.approve_status_changed? || self.gcm_api_key_changed?)
        designation_id = Designation.find_by(:name=>self.designation).id
        response = $gcm.add(eval("$key_name_" + designation_id.to_s), "788763458333", eval("$notification_key_" + designation_id.to_s), [self.gcm_api_key])
        logger.info "+++++++++++++++++++++++++++++++++GSM ADD+++++++++++#{eval("$key_name_" + designation_id.to_s)}+++++++++++++ $key_name_" + designation_id.to_s
        logger.info response
      end   
    end
end
