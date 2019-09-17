node(:number_of_pages) { @forums.total_pages }
node(:number_of_forums) { @forums.total_entries }
child @forums, :object_root => false do 
	attributes :id, :question, :created_at, :closed_at, :description, :designation_ids
	node(:user_id) { |forum| forum.try(:user).try(:profile).try(:id) }
	node(:is_current_user) { |forum| forum.user == @user }
end
