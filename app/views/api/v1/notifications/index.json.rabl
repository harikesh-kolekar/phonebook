node(:number_of_pages) { @notifications.total_pages }
child @notifications do
	attributes :id, :title, :notification_type, :attachment_content_type, :attachment_file_name 
	node(:attachment) { |m| m.attachment.url }
end