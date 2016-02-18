require "google/api_client"
require "google_drive"

class Borrower < ActiveRecord::Base
	validates :first_name, presence: true, length: { maximum: 35 } 
	validates :last_name, presence: true, length: { maximum: 45 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	validates :credit_score, presence: true, numericality: { only_integer: true }
	
	has_one :application
	has_one :address
	has_one :coborrower
	
	accepts_nested_attributes_for :application, :address, :coborrower

	def save_application
		# Create session. Prompts credential via command line the first time, 
		# then saves to given file for later usage
		#session = GoogleDrive.saved_session("config.json")
		client = Google::APIClient.new
		auth = client.authorization
		auth.client_id = ENV["google_client_id"]
		auth.client_secret = ENV["google_client_secret"]
		auth.scope = "https://www.googleapis.com/auth/drive" +
    "https://spreadsheets.google.com/feeds/"
    auth.redirect_uri = "http://localhost:3000"
    auth.refresh_token = ENV["google_refresh_token"]
    auth.fetch_access_token!
    session = GoogleDrive.login_with_oauth(auth.access_token)
		
		# Get worksheet from spreadsheet
		loan_ws = session.spreadsheet_by_key(ENV["spreadsheet_key"]).worksheets[0]
		contact_ws = session.spreadsheet_by_key(ENV["spreadsheet_key"]).worksheets[1]
		
		next_row = loan_ws.num_rows + 1
		
		# Write timestamp to Loan worksheet
		loan_ws[next_row, 1] = self.created_at.to_s
		
		# Write borrower name (first and last) to Loan worksheet
		loan_ws[next_row, 2] = self.first_name
		loan_ws[next_row, 3] = self.last_name
		
		# Write loan information (i.e. Application data) to Loan worksheet
		loan_ws[next_row, 4] = self.credit_score
		loan_ws[next_row, 5] = self.application.loan_purpose
		loan_ws[next_row, 6] = self.application.property_type
		loan_ws[next_row, 7] = self.application.purchase_price
		loan_ws[next_row, 8] = self.application.budget
		loan_ws[next_row, 9] = self.application.zip_code
		
		loan_ws.save
		
		# Write borrower information to Contact worksheet
		next_row = contact_ws.num_rows + 1
		contact_ws[next_row, 1] = self.first_name
		contact_ws[next_row, 2] = self.last_name
		contact_ws[next_row, 3] = self.email
		contact_ws[next_row, 4] = self.phone
		contact_ws[next_row, 5] = self.credit_score
		
		# Write non-required fields if present
		contact_ws[next_row, 6] = self.income if not self.income.nil?
		contact_ws[next_row, 7] = self.monthly_debt if not self.monthly_debt.nil?
		contact_ws[next_row, 8] = self.employer if not self.employer.empty?
		contact_ws[next_row, 9] = self.employed_since if not self.employed_since.nil?
		
		# Write borrower address information to Contact worksheet
		contact_ws[next_row, 10] = self.address.street_1
		contact_ws[next_row, 11] = self.address.city
		contact_ws[next_row, 12] = self.address.state
		contact_ws[next_row, 13] = self.address.zip_code
		
		# Write coborrower info to Contact worksheet
		# Need to add Spouse (bool) column
		
		contact_ws[next_row, 14] = self.coborrower.first_name 
		contact_ws[next_row, 15] = self.coborrower.last_name
		contact_ws[next_row, 16] = self.coborrower.credit_score  	
		
		contact_ws.save
		
		loan_ws.reload
		contact_ws.reload
	end
	
end
