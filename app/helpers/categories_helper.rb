module CategoriesHelper

    def get_categories
        products = Product.all.select { |product| product.available || product.quantity > 0  }
        categories = Category.where.not(id: 1).sort_by(&:name)
        return categories
    end

    def get_subcategories(category)
        return Product.where(category_id: category.id).sort_by(&:name).pluck(:subcategory_id).uniq
    end

    module_function :get_categories
end
