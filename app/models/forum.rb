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
#  description :string(255)
#  closed_at   :datetime
#

class Forum < ActiveRecord::Base
	has_and_belongs_to_many :designations
	has_many :forum_replays
	belongs_to :user
	validates :question, presence: true
	before_save :update_closed_at

	scope :approved, -> { where(is_approved: true) }
	scope :active, -> { where(is_closed: false) }
	scope :closed, -> { where(is_closed: true) }
	scope :pending, -> { where(is_approved: false) }
	self.per_page = 10
	def update_closed_at
		self.closed_at = Time.now if self.is_closed == true
	end
end
