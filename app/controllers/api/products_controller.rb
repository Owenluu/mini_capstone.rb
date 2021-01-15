class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    @products = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @products = Product.new{
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    }
    @products.save
    render "show.json.jb"
  end

  def update
    @products = Product.find_by(id: params[:id])
    @products.name = params[:name] || @product.name
    @products.price = params[:price] || @product.price
    @products.image_url = params[:image_url] || @product.image_url
    @products.description = params[:description] || @product.description
    @products.save
    render "show.json.jb"
  end

  def destroy
    products = Product.find_by(id: params[:id])
    products.destory
    render json: { message: "Products sucessfully destroyed!" }
  end
end
