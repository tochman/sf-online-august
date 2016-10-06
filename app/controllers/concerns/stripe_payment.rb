module StripePayment
  extend ActiveSupport::Concern

  def self.perform_payment(customer)
    #binding.pry
    # @amount = 500 # Grab this from the ShoppingCart when they click the "Pay Now" button
    #
    # customer = Stripe::Customer.create(
    #     email: customer.email,
    #     source:
    # )
    # charge = Stripe::Charge.create(
    #    # customer:      customer.id,
    #     amount:        @amount,
    #     description:   'Best Slow Food order',
    #     currency:      'sek'
    # )
  end
end