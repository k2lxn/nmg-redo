class Address < ActiveRecord::Base
	validates :street_1, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { maximum: 2 }
	validates :zip_code, presence: true, 
											 format: { with: /\A\d{5}\z/, message: "Please enter a 5 digit Zip Code" }
	
	belongs_to :borrower
end
