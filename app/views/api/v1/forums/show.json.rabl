node(:number_of_pages) { @forum_replays.total_pages }
node(:number_of_forum_replays) { @forum_replays.total_entries }
node(:forum_question) { @forum.question }
node(:forum_created_at) { @forum.created_at }
node(:forum_user_id) { @forum.user_id}
child @forum_replays, :object_root => false do
	attributes :id, :answer, :created_at, :user_id
end
