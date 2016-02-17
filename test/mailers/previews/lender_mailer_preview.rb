# Preview all emails at http://localhost:3000/rails/mailers/lender_mailer
class LenderMailerPreview < ActionMailer::Preview
	def lead_alert_preview
		LenderMailer.lead_alert(Borrower.last)
	end
	
end
