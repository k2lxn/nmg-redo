module ApplicationHelper
	
	# Returns the full title on a per-page basis
	def full_title(page_title = '') 
		base_title = "Nationwide Mortgage"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
	
	# Takes a select field name and returns options_for_select
	def select_options(field_name)
  	select_options = {"term" => [["15yr", 15.0], ["30yr", 30.0]], 
							"rate" => (3.0..5.5).step(0.125).map {|x| [x.to_s, x]},
							"down" => (10.0..30.0).step(0.25).map {|x| [x.to_s, x]}}
  	select_options[field_name]
  end
end
