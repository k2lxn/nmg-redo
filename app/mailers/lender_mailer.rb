class LenderMailer < ApplicationMailer
	default from: "alert@nationwidemtg.us", to: "jane.e.reynolds@gmail.com"
	
	def lead_alert(borrower)
		@borrower = borrower
		mail(subject: "New loan applicant")
	end
	
end
