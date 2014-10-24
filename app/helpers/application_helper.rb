module ApplicationHelper
	def display_alert(type = :notice)
		if flash[type]
			content_tag(:div, "data-alert" => "data-alert", :class => "alert-box #{type}") do
				flash[type]
			end
		end
	end
end
