class MortgageCalculatorsController < ApplicationController
  def edit
  	@mrtg_calc = MortgageCalculator.find(1)
  	
  	# Get results from MortgageCalculator class
  	# i.e. @results = calculate(@mrtg_calc.to_a)
  end

  def update
  end
end
