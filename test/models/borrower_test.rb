require 'test_helper'

class BorrowerTest < ActiveSupport::TestCase
  
  def setup												
  	@borrower = Borrower.new( first_name: "Example",last_name: "Borrower",
  														email: "user@example.com",credit_score: 720 )
  	address = Address.new( street_1: "123 Fake St",city: "Washington D.C.",state: "MD",
  													zip_code: "20004")
  	application = Application.new( loan_purpose: "purchase",property_type: "primary",
  																purchase_price: 500000,budget: 20000,zip_code: "94110")  	
  	@borrower.address = address
  	@borrower.application = application
  end
  
  test "should be valid" do
  	assert @borrower.valid?
  end
  
  test "first name should be present" do
  	@borrower.first_name = "      "
  	assert_not @borrower.valid?
  end
  
  test "last name should be present" do
  	@borrower.last_name = "      "
  	assert_not @borrower.valid?
  end
  
  test "email should be present" do
  	@borrower.email = "      "
  	assert_not @borrower.valid?
  end	
  
  test "credit score should be present" do
  	@borrower.credit_score = nil
  	assert_not @borrower.valid?
  end
  
  test "first name should not be too long" do 
  	@borrower.first_name = "a" * 36
    assert_not @borrower.valid?
  end
  
  test "last name should not be too long" do 
  	@borrower.last_name = "a" * 46
    assert_not @borrower.valid?
  end
  
  test "email should not be too long" do 
  	@borrower.email = "a" * 244 + "@example.com"
  	assert_not @borrower.valid?
  end
  
  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @borrower.email = valid_address
      assert @borrower.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @borrower.email = invalid_address
      assert_not @borrower.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "credit score should be numerical" do
  	@borrower.credit_score = "/730"
  	assert_not @borrower.valid?, "#{@borrower.credit_score} should be invalid"
  end
  
end
