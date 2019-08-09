node(:number_of_pages) { @forums.total_pages }
node(:number_of_forums) { @forums.total_entries }
child @forums do
	attributes :id, :question
end