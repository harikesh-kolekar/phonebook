# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  first_name        :string(255)
#  middle_name       :string(255)
#  last_name         :string(255)
#  designation       :string(255)
#  education         :string(255)
#  phone_no          :string(255)
#  mobile_no         :string(255)
#  email             :string(255)
#  home_district     :string(255)
#  home_taluka       :string(255)
#  date_of_birth     :date
#  date_of_join_dept :date
#  present_post      :string(255)
#  posting_district  :string(255)
#  posting_taluka    :string(255)
#  posting_date      :string(255)
#  batch             :string(255)
#  other_info        :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Profile < ActiveRecord::Base

	def name
		self.first_name + " " + self.middle_name + " " + self.last_name
	end
end
