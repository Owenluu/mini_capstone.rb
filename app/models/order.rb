class Order < ApplicationRecord
  belongs_to :user
  belongs_to :products
  has_many :products, through: :carted_products
end
