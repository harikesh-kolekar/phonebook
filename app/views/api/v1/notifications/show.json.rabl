object @notification 
attributes :id, :title, :notification_type
node(:attachment) { |m| m.attachment.url }