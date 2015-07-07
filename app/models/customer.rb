class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :password

  after_create :create_stripe_customer

  def create_stripe_customer
    customer = Stripe::Customer.create(
      email: self.email
    )

    self.update_attribute(:stripe_customer_id, customer.id)
  end

  def add_card(card_hash)
    customer =  Stripe::Customer.retrieve( self.stripe_customer_id )
    card = customer.sources.create(
        :source => {
            :object => 'card',
            :number => card_hash[:number],
            :cvc => card_hash[:cvc],
            :exp_month => card_hash[:exp_month],
            :exp_year => card_hash[:exp_year]
        }
    )
    result = self.payment_cards.create(
      last4: card.last4,
      brand: card.brand,
      funding: card.funding,
      exp_month: card.exp_month,
      exp_year: card.exp_year,
      fingerprint: card.fingerprint,
      country: card.country
    )

  end

  def card_exists?(card_hash)
    card_token = Stripe::Token.create(
        :card => card_hash
    )
    fingerprint = card_token.card.fingerprint

    customer_card = self.payment_cards.where(fingerprint: fingerprint)

    if customer_card.length > 0
      true
    else
      false
    end
  end

  def active_order
    self.orders.where(state: 'in_progress').last
  end

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payment_cards
end
