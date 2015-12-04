class RefinanceCalculatorsController < ApplicationController
  def edit
  	@refinance_calc = RefinanceCalculator.find(1)
  	
  	@result = @refinance_calc.calculate
  end

  def update
  	@refinance_calc = RefinanceCalculator.find(1)
  	
  	@refinance_calc.update(calc_params)
  	
  	@result = @refinance_calc.calculate
  	
  	render "edit"
  end
  
  private
  
  	def calc_params
  		params.require(:refinance_calculator).permit(:loan_amt, :original_rate,
  		 							 :original_term, :payments, :new_rate, :new_term)
  	end
end
