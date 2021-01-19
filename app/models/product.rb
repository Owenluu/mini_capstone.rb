class Product < ApplicationRecord
  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

 
end

class user < activveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
end
