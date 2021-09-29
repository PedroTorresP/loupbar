class HomeController < ApplicationController
  def index
    @products = Product.where('DATE(date) <= ?', Date.today).order(date: :desc).first(5)
    @wishlist = Product.all.last(5)
  end

end
