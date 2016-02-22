class Application < ActiveRecord::Base
	DOLLAR_AMOUNT_REGEX = /\A(\$)?(\d{1,3})((,)?\d{3})*(\.\d{2})?\Z/
	validates :loan_purpose, :property_type, presence: true
	validates :purchase_price, :budget, presence: true, format: { with: DOLLAR_AMOUNT_REGEX, message: "Please enter your Purchase Price in U.S. Dollars"} 
	validates :zip_code, presence: true, format: { with: /\A\d{5}\z/, message: "Please enter a 5 digit Zip Code" }
											 
	
	belongs_to :borrower
end
