class CartController < ApplicationController
  def overview
  end

  def checkout
    current_customer.active_order.update_totals!
    @subtotal = current_customer.active_order.subtotal
    @tax = current_customer.active_order.tax
    @total = current_customer.active_order.total

  end

  def status
  end

  def add_product(id)
    current_customer.active_order.products << Product.find(id)
  end
end
