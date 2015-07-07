class OrderItem < ActiveRecord::Base
  validate :product_present
  validate :order_present


  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  belongs_to :product
  belongs_to :order
end
