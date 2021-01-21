class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:search]
      @products = @products.where("title ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount] == "true"
      @products = @products.where("price < ?", 350)
    end

    # if params[:sort] == "price" && params[:sort_order] == "asc"
    #   @products = products.where(price: :asc)
    # elsif params[:sort] == "price" && params[:sort_order] == "desc"
    #   @products = products.where(price: :desc)
    # else
    #   @products = @products.where(id: :asc)
    # end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @products.errors.full_messages }, status: 422
    end
  end

  def destroy
    products = Product.find_by(id: params[:id])
    products.destory
    render json: { message: "Products sucessfully destroyed!" }
  end
end
