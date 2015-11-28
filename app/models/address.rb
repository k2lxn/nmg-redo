class Address < ActiveRecord::Base
	validates :street_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true
	
	belongs_to :borrower
end
