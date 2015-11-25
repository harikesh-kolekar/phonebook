node(:number_of_pages) { @notifications.total_pages }
node(:number_of_notifications) { @notifications.total_entries }
child @notifications do
	attributes :id, :title, :notification_type, :attachment_content_type, :attachment_file_name, :description
	node(:attachment) { |m| m.attachment.url }
end