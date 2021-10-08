module ProductsHelper
    def low_stock_count
        nb_low_stock = 0
        nb_low_stock += Product.all.select { |p| p.quantity.to_i < p.min_stock.to_i && p.available  }.length
        return nb_low_stock
    end
    module_function :low_stock_count
end
