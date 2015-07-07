class AddDefaultPrimaryToProductImages < ActiveRecord::Migration
  def change
    change_column_default :product_images, :primary, true
  end
end
