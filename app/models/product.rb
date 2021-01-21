class Product < ApplicationRecord

  # validates :name, presence: true
  # validates :email, uniqueness: true
  # validates :price, presence: mumericality: { greater_than: 0 }
  # validates :description, presence: true
  # validates :description, acceptance: { message: "length must be a minimum of 2 and a maximum of 500 characters"}

  def is_discounted?
    price <= 350
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  validates :name, presence: true
  validates :email, uniqueness: true
end
