class MortgageCalculatorsController < ApplicationController
  def edit
  	@mrtg_calc = MortgageCalculator.find(1)
  	
  	# Get results from MortgageCalculator class
  	# i.e. @results = calculate(@mrtg_calc.to_a)
  	@result = @mrtg_calc.calculate
  	
  end

  def update
  	@mrtg_calc = MortgageCalculator.find(1)
  	
  	@mrtg_calc.update(calc_params)
  	
  	@result = @mrtg_calc.calculate
  	
  	render "edit"
  end
  
  private
  	
  	def calc_params
  		params.require(:mortgage_calculator).permit(:loan_amt, :rate, :term)
  	end
  
end
