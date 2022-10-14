require "test_helper"

class Admin::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_end_users_index_url
    assert_response :success
  end

  test "should get show　edit" do
    get admin_end_users_show　edit_url
    assert_response :success
  end
end
