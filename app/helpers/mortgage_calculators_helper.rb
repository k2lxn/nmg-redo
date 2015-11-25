module MortgageCalculatorsHelper
	# Takes an InputField
	def select_options(field_name)
  	select_options = {"term" => [["15yr", 15], ["30yr", 30]], 
							"rate" => (3.0..5.5).step(0.125),
							"down" => (10.0..30.0).step(0.25)}
  	select_options[field_name]
  end
end
