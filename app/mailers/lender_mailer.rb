class LenderMailer < ApplicationMailer
	default from: "jane.e.reynolds@gmail.com" to: "jane.e.reynolds@gmail.com"
	
	def lead_alert(borrower)
		@borrower = borrower
		mail(subject: "Test 02/17")
	end
	
end
