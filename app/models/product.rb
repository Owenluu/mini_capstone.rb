class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 2..1000 }

  has_many :orders
  belongs_to :supplier
  has_many :category_products

  has_many :images

  scope :title_search, ->(search_terms) do
          if search_terms
            where("name ILIKE ?", "%#{search_terms}%")
          end
        end

  scope :discounted, ->(check_discount) do
          if check_discount
            where("price < ?", 10)
          end
        end

  scope :sorted, ->(sort, sort_order) do
          if sort == "price" && sort_order == "asc"
            order(price: :asc)
          elsif sort == "price" && sort_order == "desc"
            order(price: :desc)
          else
            order(id: :asc)
          end
        end

  def is_discounted?
    price <= 200
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  belongs_to :supplier
end
