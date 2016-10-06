class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart_using :shopping_cart_item

  belongs_to :user
  validates_presence_of :user
end
