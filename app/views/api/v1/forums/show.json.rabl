node(:number_of_pages) { @forum_replays.total_pages }
node(:number_of_forum_replays) { @forum_replays.total_entries }
node(:question) { @forum.question }
node(:created_at) { @forum.created_at }
node(:user_id) { @forum.try(:user).try(:profile).try(:id)}
node(:description) { @forum.description}
node(:created_at) { @forum.created_at}
node(:designation_ids) { @forum.designation_ids}
node(:closed_at) { @forum.closed_at}

child @forum_replays, :object_root => false do
	attributes :id, :answer, :created_at
	node(:user_id) { |forum_replay| forum_replay.try(:user).try(:profile).try(:id) }
	node(:is_current_user) { |forum_replay| forum_replay.user == @user }
end
