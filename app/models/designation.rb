# == Schema Information
#
# Table name: designations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Designation < ActiveRecord::Base
	  has_and_belongs_to_many :notifications
	  has_and_belongs_to_many :forum

end
