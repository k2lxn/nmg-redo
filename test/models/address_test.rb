require 'test_helper'

class AddressTest < ActiveSupport::TestCase	
	def setup												
  	@address = Address.new( street_1: "123 Fake St",city: "Washington D.C.",state: "MD",
  													zip_code: "20004")
  end
  
  test "should be valid" do
  	assert @address.valid?
  end
  
  test "street should be present" do
		@address.street_1 = "      "
		assert_not @address.valid?
	end
  
  test "city should be present" do
  	@address.city = "      "
  	assert_not @address.valid?
  end
  
  test "state should be present" do
  	@address.state = "      "
  	assert_not @address.valid?
  end
  
  test "zip code should be present" do
  	@address.zip_code = "      "
  	assert_not @address.valid?
  end	
  
  test "state should be two characters" do
  	@address.state = "CAA"
  	assert_not @address.valid?
  end
  
  test "zip code should be numerical" do
  	@address.zip_code = "A94151"
  	assert_not @address.valid?
  end
end
