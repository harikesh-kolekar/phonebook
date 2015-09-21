collection @profiles
attributes :id, :name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :imei_code, :gcm_api_key, :home_district, :posting_district, :email, :lat, :long
node(:medium_photo) { |m| m.photo.url(:medium)}
	node(:medium_icard) { |m| m.icard.url(:medium)}
	node(:date_of_birth) { |m| date_to_string(m.date_of_birth)}
	node(:date_of_join_dept) { |m| date_to_string(m.date_of_join_dept)}
	node(:posting_date) { |m| date_to_string(m.posting_date)}