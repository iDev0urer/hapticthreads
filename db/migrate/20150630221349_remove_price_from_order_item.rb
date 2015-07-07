class RemovePriceFromOrderItem < ActiveRecord::Migration
  def change
    remove_column :order_items, :price
    remove_column :order_items, :on_sale
  end
end
