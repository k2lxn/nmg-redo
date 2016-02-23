class LenderMailer < ApplicationMailer
	default from: "alert@nationwidemtg.us", to: "george@nationwidemtg.us"
	
	def lead_alert(borrower)
		@borrower = borrower
		mail(subject: "New loan applicant")
	end
	
end
