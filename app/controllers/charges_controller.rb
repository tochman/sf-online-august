class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500 # Grab this from the ShoppingCart when they click the "Pay Now" button

    charge = Stripe::Charge.create(
      customer:      customer.id,
      amount:        @amount,
      description:   'Best Slow Food order',
      currency:      'sek'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
