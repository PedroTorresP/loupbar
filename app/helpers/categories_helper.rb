module CategoriesHelper

    def get_categories
        products = Product.all.select { |product| product.available || product.quantity > 0  }
        categories = Category.where.not(id: 1)
        subcategories = Subcategory.where.not(id: 1)
        lstCategories = {}
        p '-------------------------------------------------------------------->'
        categories.each do |category|
            lst = Product.where(category_id: category.id).pluck(:subcategory_id).uniq
        end
        p lstCategories
        return categories
    end

    def get_subcategories(category)
        return Product.where(category_id: category.id).pluck(:subcategory_id).uniq
    end

    module_function :get_categories
end
