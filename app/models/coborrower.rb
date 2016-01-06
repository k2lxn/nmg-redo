class Coborrower < ActiveRecord::Base
	validates :spouse, presence: true
	validates :first_name, presence: true, length: { maximum: 35 } 
	validates :last_name, presence: true, length: { maximum: 45 }
	
	belongs_to :borrower
end
