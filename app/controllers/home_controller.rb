class HomeController < ApplicationController
  def index
    @products = Product.where('DATE(date) <= ?', Datevent.today).order(date: :desc).first(5)
    @wishlist = Product.all.last(5)
    @events = Event.all.select { |event| event.date >= Datevent.today.beginning_of_week && event.date <= Datevent.today.end_of_week }
    p "--------------"
    p @events
  end

end
