class Order < ActiveRecord::Base
  include AASM

  @tax_rate = SiteSettings.tax_rate ? SiteSettings.tax_rate : ENV['DEFAULT_TAX_RATE'].to_f
  @@tax_rate = @tax_rate

  scope :open_orders, -> { where(state: :in_progress) }

  aasm  column: :state, whiny_transitions: false do

    state :in_progress, initial: true
    state :processing, before_enter: :update_total!
    state :placed
    state :shipping
    state :delivered
    state :canceled
    state :returning
    state :returned

    event :process do
      transitions from: :in_progress, to: :processing
    end

    event :place do
      transitions from: :processing, to: :placed
    end

    event :ship do
      transitions from: :placed, to: :shipping
    end

    event :shipped do
      transitions from: :shipping, to: :delivered
    end

    event :return do
      transitions from: :delivered, to: :returning
    end

    event :returned do
      transitions from: :returning, to: :returned
    end

    event :cancel do
      transitions from: :in_progress, to: :canceled
    end

  end

  def update_subtotal!
    prices = []

    products.collect do |p|
      prices << p.price unless p.on_sale && p.sale_price
      if p.on_sale && p.sale_price then prices << p.sale_price end
    end

    self.update_attribute(:subtotal, BigDecimal(prices.sum))

  end

  def update_total!
    self.update_attribute(:total, (self.subtotal + self.tax))
  end

  def update_tax!
    self.update_attribute(:tax, (self.subtotal / @@tax_rate))
  end

  def update_totals!
    self.update_subtotal!
    self.update_tax!
    self.update_total!
  end


  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :customer

end
