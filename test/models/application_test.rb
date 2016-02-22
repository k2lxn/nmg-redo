require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  def setup 
  	@application = Application.new( loan_purpose: "purchase",property_type: "primary",
  																purchase_price: 500000,budget: 20000,zip_code: "94110")  	
  	@valid_dollar_amounts = ["10,500.00", "350000", "$1,000,000"]
  	@invalid_dollar_amounts = ["100.500.00", "1500,00", "140 000 00", "A3400", "#500"]
  end
  
  test "should be valid" do 
  	assert @application.valid?
  end
  
  test "loan purpose should be present" do
  	@application.loan_purpose = "     "
  	assert_not @application.valid?
  end
  
  test "property type should be present" do
  	@application.property_type = "     "
  	assert_not @application.valid?
  end
  
  test "purchase price should be present" do
  	@application.purchase_price = "     "
  	assert_not @application.valid?
  end
  
  test "budget should be present" do
  	@application.budget = "     "
  	assert_not @application.valid?
  end
  
  test "zip code should be present" do
  	@application.zip_code = "     "
  	assert_not @application.valid?
  end
	
	test "purchase price should be in valid USD format" do 
		@valid_dollar_amounts.length.times do |n|
			@application.purchase_price = @valid_dollar_amounts[n]
			assert @application.valid?, "#{@valid_dollar_amounts[n]} should be valid"
		end
		@invalid_dollar_amounts.length.times do |n|
			@application.purchase_price = @invalid_dollar_amounts[n]
			assert_not @application.valid?, "#{@invalid_dollar_amounts[n]} should be invalid"
		end
	end
	
	test "budget should be in valid USD format" do 
	
	end
end
