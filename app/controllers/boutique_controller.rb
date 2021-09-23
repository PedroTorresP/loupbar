class BoutiqueController < ApplicationController

    # GET /products or /products.json
    def index
      @products = Product.all.select { |p| p.available  }
    end

    def produit
      @product = Product.find_by_id(request.query_parameters[:id])
    end
end
