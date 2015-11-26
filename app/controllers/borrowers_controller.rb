class BorrowersController < ApplicationController
  def new
  	@borrower = Borrower.new
  	@borrower.application = Application.new
  	@borrower.address = Address.new
  	@borrower.coborrower = Coborrower.new
  end

  def create
  end
  
  
end
