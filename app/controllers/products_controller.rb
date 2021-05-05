class ProductsController < ApplicationController

  include SalesHelper

  def index
    products = Product.all.order(created_at: :desc)
    @products = apply_discounts(products)
  end

  def show
    @product = Product.find params[:id]
  end
  
end
