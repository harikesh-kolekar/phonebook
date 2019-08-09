node(:number_of_pages) { @forum_replays.total_pages }
node(:number_of_forum_replays) { @forum_replays.total_entries }
node(:forum_question) { @forum.question }
child @forum_replays do
	attributes :id, :answer
end
