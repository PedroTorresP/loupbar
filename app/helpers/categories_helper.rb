module CategoriesHelper

    def get_categories
        productsCategory = Product.all.select { |product| product.available || product.quantity > 0 }.pluck(:category_id).uniq
        categories = Category.all.select{ |category| productsCategory.include?(category.id)  }.sort_by(&:name)
        return categories
    end

    def get_subcategories(category)
        productsSubcategory = Product.all.select { |product| product.category_id == category.id && (product.available || product.quantity > 0) }.pluck(:subcategory_id).uniq
        subcategories = Subcategory.all.select{ |subcategory| productsSubcategory.include?(subcategory.id)  }.sort_by(&:name)
        return subcategories
    end

    module_function :get_categories
end
