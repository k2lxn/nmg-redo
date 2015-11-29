require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  def setup 
  	@application = Application.new( loan_purpose: "purchase",property_type: "primary",
  																purchase_price: 500000,budget: 20000,zip_code: "94110")  	
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
  
  test "purchase price should be numerical" do
  	@application.purchase_price = "$14,000"
  	assert_not @application.valid?
  end
  
  test "budget should be numerical" do
  	@application.budget = "140.00.000"
  	assert_not @application.valid?
  end
end
