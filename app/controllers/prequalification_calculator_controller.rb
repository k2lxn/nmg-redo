class PrequalificationCalculatorController < ApplicationController
  def edit
  	@prequal_calc = PrequalificationCalculator.find(1)
  	
  	@result = @prequal_calc.calculate
  end

  def update
  	@prequal_calc = PrequalificationCalculator.find(1)
  	
  	@prequal_calc.update(calc_params)
  	
  	@result = @prequal_calc.calculate
  	
  	render "edit"
  end
  
  private
  
  	def calc_params
  		params.require(:prequalification_calculator).permit(:income,:debt,:rate,:term,:down)
  	end
end
