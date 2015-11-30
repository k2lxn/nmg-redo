require 'test_helper'

class MortgageCalculatorsControllerTest < ActionController::TestCase
  test "should get landing page" do
    get :edit
    assert_response :success
    assert_select "title", "Mortgage Calculator | Nationwide Mortgage"
  end

  test "should post results to landing page" do
    post(:update, {mortgage_calculator: {loan_amt: 500000, rate: 4.25, term: 15} })
    assert_response :success
  end
end
