class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    # if current_user
    @products = Product
      .title_search(params[:search])
      .discounted(params[:discount])
      .sorted(params[:sort], params[:sort_order])
    render "index.json.jb"
    # else
    #   render json: []
    # end
  end

  def create
    if current_user
      @products = Products.new(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        supplier_id: params[:supplier_id],
      )
    else
      render json: [], status: :unauthorized
    end

    if @product.save
      Image.create(product_id: @product.id, url: params[:image_url])
      render "show.json.jb"
    else
      render json: { errors: @products.errors.full_message }, status: 422
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    @product.save
    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Products Sucessfully Destroyed!" }, status: 422
  end
end
