class ProductsController < ApplicationController

  def index
    products = Product.all.order(created_at: :desc)
    @products = apply_discounts(products)
  end

  def show
    @product = Product.find params[:id]
  end

  private
  def apply_discounts(products)

    percent_off = Sale.active.maximum('percent_off')
  
    products.map { |product|
      product.discounted_price_cents = product.price_cents * (100 - percent_off) / 100
      product
    }

  end
end
