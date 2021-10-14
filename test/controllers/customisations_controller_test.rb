require "test_helper"

class CustomisationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customisation = customisations(:one)
  end

  test "should get index" do
    get customisations_url
    assert_response :success
  end

  test "should get new" do
    get new_customisation_url
    assert_response :success
  end

  test "should create customisation" do
    assert_difference('Customisation.count') do
      post customisations_url, params: { customisation: { image: @customisation.image, name: @customisation.name, value: @customisation.value } }
    end

    assert_redirected_to customisation_url(Customisation.last)
  end

  test "should show customisation" do
    get customisation_url(@customisation)
    assert_response :success
  end

  test "should get edit" do
    get edit_customisation_url(@customisation)
    assert_response :success
  end

  test "should update customisation" do
    patch customisation_url(@customisation), params: { customisation: { image: @customisation.image, name: @customisation.name, value: @customisation.value } }
    assert_redirected_to customisation_url(@customisation)
  end

  test "should destroy customisation" do
    assert_difference('Customisation.count', -1) do
      delete customisation_url(@customisation)
    end

    assert_redirected_to customisations_url
  end
end
