module ApplicationHelper
	def flash_class(level)
		case level.to_sym
			when :notice then "alert alert-success"
			when :success then "alert alert-success"
			when :error then "alert alert-danger"
			when :alert then "alert alert-danger"
			when :warning then "alert alert-warning"
		end
	end

	def flash_prefix(level)
		case level.to_sym
			when :notice then "Success!"
			when :success then "Success!"
			when :error then "Error!"
			when :alert then "Alert!"
			when :warning then "Warning!"
		end
	end
end
