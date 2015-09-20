module ApplicationHelper
	def date_to_string(date)
		date.strftime("%d/%m/%Y") rescue ' '
	end
end
