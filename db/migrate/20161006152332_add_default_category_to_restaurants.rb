class AddDefaultCategoryToRestaurants < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :category, default: 'Other'
  end
end
