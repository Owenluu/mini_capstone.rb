class Api::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    @order.save
    render "show.json.jb"

    def show
      @order = current_user.orders.find_by(id: params[:id])
      render "show.json.jb"
    end
  end
end
