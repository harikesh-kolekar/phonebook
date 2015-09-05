class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: false, login: true}

   belongs_to :home_taluka, :foreign_key => "home_taluka_id", :class_name=>"Taluka"
   belongs_to :posting_taluka, :foreign_key => "posting_taluka_id", :class_name=>"Taluka"
   scope :all_users, -> { where('imei_code IS NOT NULL') }
   scope :approve_users, -> { where('imei_code IS NOT NULL and approve_status = 1') }
   scope :pending_users, -> { where('imei_code IS NOT NULL and approve_status = 0') }
   scope :declined_users, -> { where('imei_code IS NOT NULL and approve_status = 2') }

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
	  		return self.mobile_no1 + "/" + self.mobile_no2
	  	end
	  end

end
