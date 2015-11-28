class Borrower < ActiveRecord::Base
	validates :first_name, presence: true, length: { maximum: 35 } 
	validates :last_name, presence: true, length: { maximum: 45 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX }
	validates :credit_score, presence: true, numericality: { only_integer: true }
	
	has_one :application
	has_one :address
	has_one :coborrower
	
	accepts_nested_attributes_for :application, :address, :coborrower
	
end
