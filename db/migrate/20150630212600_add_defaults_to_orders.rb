class AddDefaultsToOrders < ActiveRecord::Migration
  def change
    change_column_default :orders, :subtotal, 0.00
    change_column_default :orders, :total, 0.00
  end
end
