require "test_helper"

class InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get livraison" do
    get information_livraison_url
    assert_response :success
  end
end
