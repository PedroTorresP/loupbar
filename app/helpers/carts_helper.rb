module CartsHelper
        def sub_total(cart)
            sum = 0
            p cart
            cart.line_items.each do |line_item|
              sum+= line_item.quantity * line_item.product.price
            end
            return sum
        end
        module_function :sub_total
end
