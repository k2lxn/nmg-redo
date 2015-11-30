require 'test_helper'

class BorrowersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Apply | Nationwide Mortgage"
  end

 # test "should get create" do
 #   get :create
 #  assert_response :success
 # end

end
