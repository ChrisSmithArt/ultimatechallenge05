class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end
  def show
    @products = Product.find(params[:id])
  end
  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_quantity)
  end
end
