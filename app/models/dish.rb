class Dish < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :restaurant

  has_and_belongs_to_many :menus
  belongs_to :restaurant

  has_attached_file :image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "assets/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
