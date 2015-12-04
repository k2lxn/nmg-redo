class PrequalificationCalculator < ActiveRecord::Base
	
	# Must return a hash with three keys: Home price, Loan amount, Monthly payment
	def calculate		
		#stub equations for development
		home_price = income / (12*15)
		loan_amt = rate * debt
		monthly_payment = term * 2
		
		result = { home_price: home_price, 
							loan_amt: loan_amt, 
							monthly: monthly_payment }	
	end
end
