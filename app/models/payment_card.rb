class PaymentCard < ActiveRecord::Base
  belongs_to :customer
end
