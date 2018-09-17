module ApplicationHelper
	def new_table_row?(num, columns)
		((num + 1) % columns == 0)
	end
end
