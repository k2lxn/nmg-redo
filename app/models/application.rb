class Application < ActiveRecord::Base
	validates :loan_purpose, :property_type, presence: true
	validates :purchase_price, :budget, presence: true, 
																			numericality: true
																			#:format => { with: /\d{1,3}(\,\d{3})*\.\d{2}/ }
																			#:format => { with: /\A\d{1,4}(\.\d{0,2})?\z/ }
	validates :zip_code, presence: true, format: { with: /\A\d{5}\z/ }
	
	belongs_to :borrower
end
