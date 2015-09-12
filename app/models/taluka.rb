# == Schema Information
#
# Table name: talukas
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Taluka < ActiveRecord::Base
	belongs_to :district
end
