collection @profiles
attributes :id, :name, :designation, :mobile_no1, :mobile_no2, :other_info, :home_district, :posting_district, :email, :lat, :long
	node(:date_of_birth) { |m| date_to_string(m.date_of_birth)}
	node(:medium_photo) { |m| m.photo.url(:medium)}
	node(:medium_icard) { |m| m.icard.url(:medium)}