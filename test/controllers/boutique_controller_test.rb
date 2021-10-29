require "test_helper"

class BoutiqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boutique_path
    assert_response :success
  end
end
