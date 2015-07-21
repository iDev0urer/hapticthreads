class CartController < ApplicationController

  add_breadcrumb "home", :root_path
  add_breadcrumb "cart", :cart_overview_path

  def overview
  end

  def checkout
    @active_order = current_customer.active_order if customer_signed_in?
    current_customer.active_order.update_totals! if @active_order

    add_breadcrumb "checkout", checkout_path
  end

  def status
  end

  def add_product(id)
    current_customer.active_order.products << Product.find(id)
  end
end
