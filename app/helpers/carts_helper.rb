module CartsHelper
        def sub_total
            sum = 0
            :line_items.each do |line_item|
              sum+= line_item.total_price
            end
            return sum
        end
end
