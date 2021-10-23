module CategoriesHelper

    def get_categories
        products = Product.all.select { |product| product.available || product.quantity > 0  }
        categories = Category.all
        subcategories = Subcategory.all
        lstCategories = {}
        p 'Liste de catégories------------------------------'
        products.each do |product|
            lstCategories[categories.find_by_id(product.category_id).name] = subcategories.find_by_id(product.subcategory_id).name
            p lstCategories.flatmap
        end
    end

    module_function :get_categories
end
