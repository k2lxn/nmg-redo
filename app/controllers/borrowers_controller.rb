class BorrowersController < ApplicationController
  def new
  	@borrower = Borrower.new
  	@borrower.application = Application.new
  	@borrower.address = Address.new
  	@borrower.coborrower = Coborrower.new
  	
  	# Select dropdown options
  	@loan_purpose_options = [["Purchase", "purchase"], ["Refinance", "refinance"]]
  	@property_type_options = [["Primary residence", "primary"], 
  														["Second/Vacation home", "secondary"], 
  														["Investment property", "investment"]]
  	#@credit_score_options = ["740+", 740], ["720 - 739", 720], ["700 - 719", 700]													 
  	@credit_score_options = credit_categories
  	@state_abbrev = state_abbreviations
  end

  def create
  end
  
  private 
  
  	def credit_categories
			scores = [["740+", 0]]
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
