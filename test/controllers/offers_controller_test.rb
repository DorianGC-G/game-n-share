require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get offers_all_url
    assert_response :success
  end

  test "should get show" do
    get offers_show_url
    assert_response :success
  end

end
