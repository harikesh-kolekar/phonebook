# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  question    :text
#  is_closed   :boolean          default(FALSE)
#  is_approved :boolean          default(FALSE)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Forum < ActiveRecord::Base
	has_and_belongs_to_many :designations
	has_many :forum_replays
	belongs_to :user
	validates :question, presence: true

	scope :approved, -> { where(is_approved: true) }
	scope :active, -> { where(is_closed: false) }
end
