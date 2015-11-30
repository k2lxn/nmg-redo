class BorrowersController < ApplicationController
  def new
  	@borrower = Borrower.new
  	@borrower.application = Application.new
  	@borrower.address = Address.new
  	@borrower.coborrower = Coborrower.new
  	
  	# Select dropdown options
  	@loan_purpose_options = loan_purpose_options
  	@property_type_options = property_type_options
  	@credit_score_options = credit_categories
  	@state_abbrev = state_abbreviations
  end

  def create
  	@borrower = Borrower.new(borrower_params)
  	if @borrower.save 
  		redirect_to '/confirm' 
  	else
  		@loan_purpose_options = loan_purpose_options
  		@property_type_options = property_type_options
  		@credit_score_options = credit_categories
  		@state_abbrev = state_abbreviations
  		
  		render 'new'
  	end		
  end
  
  private 
  
  	def borrower_params
  		params.require(:borrower).permit(:first_name,:last_name,:email,:phone,:credit_score,
  																		:income,:monthly_debt,:employer,:employed_since,
  																		application_attributes: [:loan_purpose, 
  																		:property_type,:purchase_price,:budget,:zip_code],
  																		address_attributes: [:street_1,:city,:state,
  																		:zip_code],
  																		coborrower_attributes: [:spouse,:first_name,
  																		:last_name,:credit_score] )
  	end
  	
  	def loan_purpose_options
  		[["Purchase", "purchase"], ["Refinance", "refinance"]]
  	end
  	
  	def property_type_options
  		[["Primary residence", "primary"], ["Second/Vacation home", "secondary"], 
  		["Investment property", "investment"]]
  	end
  	
  	def credit_categories
			scores = [["740+", 740]]
			(580..720).step(20).to_a.each do |num|
				display = "#{num.to_s} - #{(num + 19).to_s}"
				scores.insert(1,[display, num]) 
			end
			scores.push(["<580", 560])
		end
	
		def state_abbreviations
			["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA",
				"KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
				"NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT",
				"VA","WA","WV","WI","WY" ]
		end
  
end
