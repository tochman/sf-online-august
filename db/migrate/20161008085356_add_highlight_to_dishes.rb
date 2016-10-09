class AddHighlightToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :highlight, :boolean, default: false
  end
end
