class PaymentsController < ApplicationController

  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  def new

    @order = current_customer.orders.where(state: :in_progress).last
    @order.update_total!

    @tax = @order.tax.to_money.format

    @total = (@order.total.to_f.round(2) * 100).to_i

    Stripe.api_key = Rails.application.secrets.stripe_secret_key

    @order.state = 'processing'

    customer =  Stripe::Customer.retrieve( current_customer.stripe_customer_id )

    card_hash = {
        :number => params[:card_number],
        :cvc => params[:card_verification],
        :exp_month => params[:exp_month],
        :exp_year => params[:exp_year]
    }

    unless current_customer.card_exists?(card_hash)
      current_customer.add_card(card_hash)
    end

    charge = Stripe::Charge.create(
        :amount => @total,
        :currency => "usd",
        :customer => current_customer.stripe_customer_id
    )

    redirect_to checkout_path
    @order.state = 'processed'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to checkout_path

  end
end
