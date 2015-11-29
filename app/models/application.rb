class Application < ActiveRecord::Base
	validates :loan_purpose, :property_type, presence: true
	validates :purchase_price, :budget, presence: true, numericality: true
	validates :zip_code, presence: true
	
	belongs_to :borrower
end
