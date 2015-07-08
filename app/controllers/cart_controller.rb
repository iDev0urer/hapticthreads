class CartController < ApplicationController
  def overview
  end

  def checkout
    @active_order = current_customer.active_order if customer_signed_in?
    current_customer.active_order.update_totals! if @active_order
  end

  def status
  end

  def add_product(id)
    current_customer.active_order.products << Product.find(id)
  end
end
