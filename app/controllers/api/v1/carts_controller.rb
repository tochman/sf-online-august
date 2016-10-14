class Api::V1::CartsController < ApplicationController


  def create
    #binding.pry
    dish = Dish.find(params[:dish_id])
    cart = ShoppingCart.create
    cart.add dish, dish.price
  end
end