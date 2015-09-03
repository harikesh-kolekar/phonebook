# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  first_name        :string
#  middle_name       :string
#  last_name         :string
#  designation       :string
#  education         :string
#  phone_no          :string
#  mobile_no         :string
#  email             :string
#  home_district     :string
#  home_taluka       :string
#  date_of_birth     :date
#  date_of_join_dept :date
#  present_post      :string
#  posting_district  :string
#  posting_taluka    :string
#  posting_date      :string
#  batch             :string
#  other_info        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Profile < ActiveRecord::Base

	def name
		self.first_name + " " + self.middle_name + " " + self.last_name
	end
end
