class HomeController < ApplicationController
  def index
    @products = Product.where('DATE(date) <= ?', Date.today).order(date: :desc).first(5)
    @wishlist = Product.all.last(5)
    @events = Event.all.select { |e| e.date >= Date.today.beginning_of_week && e.date <= Date.today.end_of_week }
    p "--------------"
    p @events
  end

end
