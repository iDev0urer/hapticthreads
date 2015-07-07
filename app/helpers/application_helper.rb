module ApplicationHelper

  def product_images(product_id, size='medium')

    images = []

    ProductImage.where(product_id: product_id).order(:primary).each do |image|
      image_path = eval("image.url.#{size}.url")
      images << image_path
    end

    images
  end
end
