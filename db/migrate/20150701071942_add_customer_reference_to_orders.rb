class AddCustomerReferenceToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :customer
  end
end
