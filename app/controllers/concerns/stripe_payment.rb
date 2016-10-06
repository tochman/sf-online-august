module StripePayment
  extend ActiveSupport::Concern

  def self.perform_payment(params, cart)
    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer:      customer.id,
        amount:        (cart.total * 100).to_i,
        description:   'Best Slow Food order',
        currency:      'sek'
    )

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to charges_path
     flash[:alert] = "Please try again"

    charge
  end
end
