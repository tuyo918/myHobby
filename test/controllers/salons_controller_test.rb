require 'test_helper'

class SalonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get salons_new_url
    assert_response :success
  end

  test "should get index" do
    get salons_index_url
    assert_response :success
  end

  test "should get show" do
    get salons_show_url
    assert_response :success
  end

end
