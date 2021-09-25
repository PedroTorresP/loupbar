require "test_helper"

class CompteControllerTest < ActionDispatch::IntegrationTest
  test "should get evenements" do
    get compte_evenements_url
    assert_response :success
  end
end
