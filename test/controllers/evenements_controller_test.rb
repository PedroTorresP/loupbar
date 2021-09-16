require "test_helper"

class EvenementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evenements_index_url
    assert_response :success
  end
end
