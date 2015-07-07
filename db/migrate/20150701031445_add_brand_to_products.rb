class AddBrandToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :brand
  end
end
