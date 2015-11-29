require 'test_helper'

class ApplicationFormTest < ActionDispatch::IntegrationTest
  
  test "invalid application attempt" do
  	get apply_path
  	assert_no_difference 'Borrower.count' do
  		post apply_path, borrower: { first_name: "Boo", last_name: "Radley",
  																email: "foo@invalid", credit_score: "740" }
  	end
  	assert_template 'borrowers/new'
  end
end
