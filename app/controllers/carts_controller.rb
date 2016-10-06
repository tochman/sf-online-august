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

  def create
    cart = ShoppingCart.find(params[:cart_id])
    cart.user_id = current_user.id
    cart.save
    charge = StripePayment.perform_payment(params, cart)
    @order = ShoppingCart.find_by(user_id: current_user.id)
    unless charge.nil?
      cart.paid = true
      cart.stripe_customer = charge.id
      cart.save
      flash[:notice] = 'Your food is on its way!'
      render :checkout
    end
    # Step one: set paid to 'true'
    # Step two: Add stripe customer ID to stripe_customer on cart
    # Step three: destroy session
    #some method about taking Stripe info and making a confirmed order out of it

  end

  private
  def find_or_create_cart
    @cart = ShoppingCart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end
end
