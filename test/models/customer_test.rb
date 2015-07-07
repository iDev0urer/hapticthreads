require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  context 'Customer' do

    setup do
      @customer = Customer.create(email: 'test@test.com', password: 'testpassword')
      @stripe_customer_id = @customer.stripe_customer_id
    end

    should "save" do
      assert @customer.valid?, 'Customer exists'
    end

    should "have email" do
      assert @customer.email, 'Customer has email'
    end

    should "have password" do
      assert @customer.password, 'Customer has a password'
    end

    should "be stripe customer" do
      assert_not_nil @stripe_customer_id, 'Customer doesn\'t have stripe_customer_id'
    end

  end

end
