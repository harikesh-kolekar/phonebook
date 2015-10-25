object @notification 
attributes :id, :title, :notification_type, :attachment_content_type, :attachment_file_name, :description 
node(:attachment) { |m| m.attachment.url }