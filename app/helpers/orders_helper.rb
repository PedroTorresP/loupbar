module OrdersHelper
    def order_total(order)
        sum = 0
        order.buys.each do |buy|
          sum+= buy.quantity * buy.price
        end
        if order.shipping
            sum += 7
        end
        if order.discount
            sum -= order.discount
        end
        return sum
    end

    def order_paid(order_id)
        p '-------ici2'
        
        @order = Order.find_by_id(order_id)
        @order.is_paid == 'validation'
        @order.save
    end

    module_function :order_paid
    module_function :order_total
end
