module CartsHelper
        def sub_total(cart)
            sum = 0
            cart.line_items.each do |line_item|
              sum+= line_item.quantity * line_item.product.price
            end
            return sum
        end

        def product_quantity_cart(cart, product_id)
          quantity = Product.all.find(product_id).quantity
          if cart == nil
            return quantity
          else
            cart.line_items.each do |line_item|
              if line_item.product_id == product_id
                return quantity - line_item.quantity
              end
            end
            return quantity
          end
        end
        

        module_function :sub_total
        module_function :product_quantity_cart
end
