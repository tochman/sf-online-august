module StripePayment
  extend ActiveSupport::Concern

  def self.perform_payment
    binding.pry
  end
end