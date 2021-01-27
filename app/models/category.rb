class Category < ApplicationRecord
  has_many :categories, through: :category_products
end
