# == Schema Information
#
# Table name: notifications
#
#  id                      :integer          not null, primary key
#  title                   :string(255)
#  description             :text
#  notification_type       :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Notification < ActiveRecord::Base

  has_attached_file :attachment
  has_and_belongs_to_many :designations
  validates_attachment_content_type :attachment, content_type: [/\Aimage\/.*\Z/, 'application/pdf', 'application/msword', 'text/plain']
  def file_attached?
	  self.pdf.file?
  end
 
end
