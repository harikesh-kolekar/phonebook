# == Schema Information
#
# Table name: forum_replays
#
#  id         :integer          not null, primary key
#  answer     :text
#  forum_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ForumReplay < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user
	validates :forum, :answer, presence: true
	self.per_page = 10
end
