node(:number_of_pages) { @profiles.total_pages }
node(:number_of_profiles) { @profiles.total_entries }
node(:number_of_notifications) { @notification_count }
child @profiles do
	attributes :id, :name, :designation, :mobile_no1, :mobile_no2, :other_info, :home_district, :posting_district, :email
		node(:date_of_birth) { |m| date_to_string(m.date_of_birth)}
		node(:medium_photo) { |m| m.photo.url(:medium)}
		node(:medium_icard) { |m| m.icard.url(:medium)}
end