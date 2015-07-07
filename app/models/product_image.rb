class ProductImage < ActiveRecord::Base
  mount_uploader :url, ImageUploader

  belongs_to :product
end
