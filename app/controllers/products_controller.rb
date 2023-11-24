# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
