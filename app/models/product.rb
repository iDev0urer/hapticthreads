class Product < ActiveRecord::Base


  default_scope { where(active: true) }

  belongs_to :category
  belongs_to :order
  has_many :product_images
end
