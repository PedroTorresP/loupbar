require "application_system_test_case"

class CustomisationsTest < ApplicationSystemTestCase
  setup do
    @customisation = customisations(:one)
  end

  test "visiting the index" do
    visit customisations_url
    assert_selector "h1", text: "Customisations"
  end

  test "creating a Customisation" do
    visit customisations_url
    click_on "New Customisation"

    fill_in "Image", with: @customisation.image
    fill_in "Name", with: @customisation.name
    fill_in "Value", with: @customisation.value
    click_on "Create Customisation"

    assert_text "Customisation was successfully created"
    click_on "Back"
  end

  test "updating a Customisation" do
    visit customisations_url
    click_on "Edit", match: :first

    fill_in "Image", with: @customisation.image
    fill_in "Name", with: @customisation.name
    fill_in "Value", with: @customisation.value
    click_on "Update Customisation"

    assert_text "Customisation was successfully updated"
    click_on "Back"
  end

  test "destroying a Customisation" do
    visit customisations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customisation was successfully destroyed"
  end
end
