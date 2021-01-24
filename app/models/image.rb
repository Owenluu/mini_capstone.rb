class Image < ApplicationRecord
  belongs_to :product

  # def product
  #   Product.find_by(image_id: id)
  # end

end
