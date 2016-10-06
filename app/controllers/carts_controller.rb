class CartsController < ApplicationController
  #include StripePayment
  before_action :find_or_create_cart, only: [:index, :add_item]

  def index
  end

  def add_item
    @dish = Dish.find(params[:dish_id])
    @cart.add(@dish, @dish.dish_price)
    flash[:notice] = "#{@dish.dish_name} added to cart"
    redirect_back(fallback_location: restaurants_path)
  end

  def checkout
    @order = ShoppingCart.find(params[:format])
    charge = StripePayment.perform_payment(current_user)
    binding.pry
    session.delete(:cart_id)
    flash[:notice] = 'Your food is on its way!'
    # In a later feature this needs to create some action item to actually make the order happen.
    # Restrict this function to a Customer
  end

  def create
    cart = ShoppingCart.find(params[:cart_id])
    charge = StripePayment.perform_payment(params, cart)

    binding.pry
  end

  private
  def find_or_create_cart
    @cart = ShoppingCart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end
end
