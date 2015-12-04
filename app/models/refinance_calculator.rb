class RefinanceCalculator < ActiveRecord::Base

	# Must return a hash with three keys: New balance, Monthly savings, Interest savings
	def calculate		
		#stub equations for development
		new_balance = (loan_amt * original_rate) - loan_amt
		monthly_savings = (loan_amt - new_balance) / 12
		interest_savings = (loan_amt * original_rate) - (new_balance * new_rate)
		
		result = { new_balance: new_balance, 
							monthly_savings: monthly_savings, 
							interest_savings: interest_savings }	
	end
end
