require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  context 'Order' do

    setup do
      @customer = Customer.create(email: 'test@test.com', password: 'testpassword')
      @order = @customer.orders.create!
    end

    should 'be valid' do
      assert @order.valid?, 'Order is valid'
    end

    should 'belong to customer' do
      assert @order.customer, 'Order belongs to a customer'
    end

  end

end
