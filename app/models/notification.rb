# == Schema Information
#
# Table name: notifications
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :text
#  notification_type       :string
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Notification < ActiveRecord::Base

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: ['application/pdf', 'application/msword', 'text/plain']
  def file_attached?
	  self.pdf.file?
  end
 
end
