module LineItemsHelper
  def total_price
    :quantity * :product.price
  end
end
