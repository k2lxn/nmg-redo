class Address < ActiveRecord::Base
	validates :street_1, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { maximum: 2 }
	validates :zip_code, presence: true, length: { is: 5 }, format: { with: /\A\d{5}\z/ }
	
	belongs_to :borrower
end
