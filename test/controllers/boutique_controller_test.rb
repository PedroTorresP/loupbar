require "test_helper"

class BoutiqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boutique_index_url
    assert_response :success
  end
end
