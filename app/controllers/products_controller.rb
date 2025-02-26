class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy] # list the methods that apply to set product method

  def index
    @products = Product.all
  end
  def show
    Rails.logger.debug "params[:id] = #{params[:id]}" # Debugging line
    # #@product = Product.find params[:id]
    # @product = Product.find_by id: params[:id]
    if @product.nil?
      redirect_to products_path, alert: "Product not found"
    end
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new product_params
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    # @product = Product.find_by params[:id]
    if @product.nil?
      redirect_to products_path, alert: "Product not found"
    end
  end
  def update
    # @product = Product.find params[:id]
    if @product.update product_params
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find_by id: params[:id]
    end

    def product_params
      params.expect product: [ :name, :description, :featured_image, :inventory_count ]
    end
end
