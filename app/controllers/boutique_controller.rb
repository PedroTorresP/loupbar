class BoutiqueController < ApplicationController

    # GET /products or /products.json
    def index
      @products = Product.all.select { |product| product.available || product.quantity > 0  }
      categoriesName = {}
      subcategoriesName = {}
      @tri = {}
      @tri['Date décroissant'] = 0
      @tri['Date croissant'] = 1
      @tri['Prix décroissant'] = 2
      @tri['Prix croissant'] = 3
      categoriesName['Toutes'] = 0
      subcategoriesName['Toutes'] = 0
      Category.all.each do |category|
        if category.available
          categoriesName[category.name] = category.id
        end
      end
      @categories = categoriesName
      Subcategory.all.each do |subcategory|
        if subcategory.available
          subcategoriesName[subcategory.name] = subcategory.id
        end
      end
      @subcategories = subcategoriesName

      if request.query_parameters[:query].to_s.length > 0
        @products = @products.select { |p| I18n.transliterate(p.name).downcase.include? I18n.transliterate(request.query_parameters[:query]).downcase  }
      end
      if request.query_parameters[:category].to_i > 0
        @products = @products.select { |p| p.category_id == request.query_parameters[:category].to_i  }
      end
      if request.query_parameters[:subcategory].to_i > 0
        @products = @products.select { |p| p.subcategory_id == request.query_parameters[:subcategory].to_i  }
      end
      
      case request.query_parameters[:tri].to_i
      when 0
        @products = @products.sort_by(&:date).reverse
      when 1
        @products = @products.sort_by(&:date)
      when 2
        @products = @products.sort_by(&:price).reverse
      when 3
        @products = @products.sort_by(&:price)
      end

      @products = Kaminari.paginate_array(@products).page(params[:page]).per(18)

    end

    def produit
      @product = Product.find_by_id(request.query_parameters[:id])
    end
end
