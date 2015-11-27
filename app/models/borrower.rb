class Borrower < ActiveRecord::Base
	has_one :application
	has_one :address
	has_one :coborrower
	
	accepts_nested_attributes_for :application, :address, :coborrower
	

end
