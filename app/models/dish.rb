class Dish < ApplicationRecord

  PERMITTED_DISH_CATEGORIES = %w(Starters Mains Desserts)

  validates_presence_of :dish_name
  validates_presence_of :category
  validates_presence_of :dish_desc
  validates_presence_of :dish_price
  validates_presence_of :restaurant

  has_and_belongs_to_many :menus
  belongs_to :restaurant
end
