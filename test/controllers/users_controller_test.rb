require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  #
  # setup do
  #   @user = User.new
  # end
  test "should get new" do
    get new_user_path
    assert_response :success
  end
end
