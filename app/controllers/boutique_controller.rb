class BoutiqueController < ApplicationController

    # GET /products or /products.json
    def index
      @products = Product.all.select { |p| p.available  }
    end
end
