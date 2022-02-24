class HomeController < ApplicationController
  def index
    @products = Product.where('DATE(date) <= ?', Date.today).order(date: :desc).first(5)
    @products += Product.select{ |product| product.description.include?('#selection') }
    @wishlist = Product.all.last(5)
    @events = Event.all.select { |event| event.date >= Date.today && event.date <= Date.today.end_of_month }
    @events = @events.sort_by{|event| event.date}
  end

end
