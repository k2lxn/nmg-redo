require 'test_helper'

class PrequalificationCalculatorControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end