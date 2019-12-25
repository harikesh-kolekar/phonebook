# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  designation        :string(255)
#  education          :string(255)
#  phone_no           :string(255)
#  mobile_no1         :string(255)      default(""), not null
#  mobile_no2         :string(255)
#  email              :string(255)
#  home_taluka_id     :string(255)
#  date_of_birth      :date
#  date_of_join_dept  :date
#  posting_date       :date
#  present_post       :string(255)
#  home_taluka        :string(255)      default("NA")
#  home_district      :string(255)      default("NA")
#  posting_district   :string(255)      default("NA")
#  posting_taluka     :string(255)      default("NA")
#  batch              :string(255)
#  other_info         :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  icard_file_name    :string(255)
#  icard_content_type :string(255)
#  icard_file_size    :integer
#  icard_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

class Profile < ActiveRecord::Base

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("profile.png")
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_attached_file :icard, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("i-card.png")
  validates_attachment_content_type :icard, content_type: /\Aimage\/.*\Z/
  after_destroy :add_deleted_record
  self.per_page = 100
  
	def self.import(file)
	workbook = RubyXL::Parser.parse(file)
	worksheet = workbook.worksheets[0]
  not_saved = []
  is_nil = 0
  row = 0
  worksheet.each do |i|
    row = row + 1
    if i.nil? || i.size == 0
      is_nil<5 ? is_nil = is_nil+1 : break
      next
    end
    is_nil = 0
    next if i[0].value == "Full Name"
    begin
      if(i[2].value.to_s.blank? && i[3].value.to_s.blank? && i[4].value.to_s.blank? && i[1].value.to_s.blank? && i[5].value.to_s.blank? && i[6].value.to_s.blank? && i[7].value.to_s.blank? && i[8].value.to_s.blank? )
        next
      end
      if(i[2].value.to_s.blank? && i[3].value.to_s.blank? && i[4].value.to_s.blank?)
        not_saved<<row
      next
      end  

      u = Profile.find_by_email(i[4].value.to_s) unless i[4].value.to_s.blank?
      if u 
      elsif (!i[2].value.to_s.blank? && get_user(i[2].value.to_s)) 
        u = get_user(i[2].value.to_s)
      elsif (!i[3].value.to_s.blank? && get_user(i[3].value.to_s))
        u = get_user(i[3].value.to_s)
      else
        u = Profile.new()
      end
      u.name = i[0].value.to_s
      u.designation = i[1].value.to_s
      if i[2].value.to_s.blank?
      		u.mobile_no1 = i[3].value.to_s
      else
      	u.mobile_no1 = i[2].value.to_s
      	u.mobile_no2 = i[3].value.to_s
      end
      u.email = i[4].value.to_s
      u.posting_district = i[5].value.to_s
      u.home_district = i[6].value.to_s
      u.date_of_birth = self.convert_string_to_date i[7].value.to_s
      u.other_info = i[8].value.to_s
      u.save!
    rescue Exception => e
      not_saved<<row
    end
  end
  return not_saved
end
 
def self.get_deleted_record_ids
  (1..Profile.maximum('id')).to_a - (Profile.all.collect(&:id))
end

def add_deleted_record
  $get_deleted_record_ids = Profile.get_deleted_record_ids unless $get_deleted_record_ids
  $get_deleted_record_ids << self.id
end

def self.get_user(mobile)
      Profile.where(user_id: nil).where("mobile_no1=? or mobile_no2=? ",mobile, mobile).first
    end
    def self.convert_string_to_date(str)
		Date.strptime(str,"%d/%m/%Y") rescue ""
	end
	def mobile_nos
	  	if self.mobile_no2.blank?
	  		return self.mobile_no1
	  	else
	  		return self.mobile_no1 + "/ " + self.mobile_no2
	  	end
	  end
end
