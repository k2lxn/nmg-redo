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
		session = GoogleDrive.saved_session("config.json")
		
		# Get worksheet from spreadsheet
		ws = session.spreadsheet_by_key("1Ntt_7-UBorOXXx6_PFfK_cE9_ElTXcQZfaebMQgBNmA").worksheets[0]
		
		next_row = ws.num_rows + 1
		
		ws[next_row, 1] = "hi jane!"
		ws.save
		ws.reload
	end
	
end
