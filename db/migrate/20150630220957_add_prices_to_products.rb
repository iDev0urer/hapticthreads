class AddPricesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, precision: 13, scale: 3
    add_column :products, :sale_price, :decimal, precision: 13, scale: 3
    add_column :products, :on_sale, :boolean
  end
end
