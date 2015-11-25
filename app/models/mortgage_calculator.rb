class MortgageCalculator < ActiveRecord::Base
	
	# Must return a hash with three keys: Monthly payment, Total payments, Total interest
	def calculate		
		#stub equations for development
		monthly_payment = loan_amt / (12*15)
		total_payment = rate
		total_interest = term * 2
		
		result = { monthly: monthly_payment, 
							total: total_payment, 
							interest: total_interest }	
	end
	
end
