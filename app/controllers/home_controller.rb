class HomeController < ApplicationController
  def index
    @products = Product.all.first(2)
    @wishlist = Product.all.last(2)
  end
end
