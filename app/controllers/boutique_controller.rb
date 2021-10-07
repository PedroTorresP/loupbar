class BoutiqueController < ApplicationController

    # GET /products or /products.json
    def index
      @products = Product.all.select { |p| p.available  }

      if request.query_parameters[:query] != nil
        @products = @products.select { |p| p.name.downcase.include? request.query_parameters[:query].downcase  }

      end
      case request.query_parameters[:tri]
      when "Date décroissant"
        @products = @products.sort_by(&:date).reverse
      when "Date croissant"
        @products = @products.sort_by(&:date)
      when "Prix décroissant"
        @products = @products.sort_by(&:price).reverse
      when "Prix croissant"
        @products = @products.sort_by(&:price)
      end
    end

    def produit
      @product = Product.find_by_id(request.query_parameters[:id])
    end
end
