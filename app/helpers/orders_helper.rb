module OrdersHelper
    def order_total(order)
        sum = 0
        order.buys.each do |buy|
          sum+= buy.quantity * buy.product.price
        end
        if order.shipping
            sum += 7
        end
        return sum
    end
    module_function :order_total
end
