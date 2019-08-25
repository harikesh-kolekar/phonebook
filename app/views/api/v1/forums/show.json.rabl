node(:number_of_pages) { @forum_replays.total_pages }
node(:number_of_forum_replays) { @forum_replays.total_entries }
node(:forum_question) { @forum.question }
child @forum_replays do
	attributes :id, :answer, :created_at, :user_id
end
