require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "Available" if @product.available
    fill_in "Category", with: @product.category
    fill_in "Description", with: @product.description
    fill_in "Id", with: @product.id
    fill_in "Image path", with: @product.image_path
    fill_in "Min stock", with: @product.min_stock
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Quantity", with: @product.quantity
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "Available" if @product.available
    fill_in "Category", with: @product.category
    fill_in "Description", with: @product.description
    fill_in "Id", with: @product.id
    fill_in "Image path", with: @product.image_path
    fill_in "Min stock", with: @product.min_stock
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Quantity", with: @product.quantity
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
