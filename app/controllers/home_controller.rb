class HomeController < ApplicationController
  def index
    @products = Product.all.first(5)
    @wishlist = Product.all.last(5)
  end
end
