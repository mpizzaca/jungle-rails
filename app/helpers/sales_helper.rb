module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def apply_discounts(products)
    percent_off = Sale.active.maximum('percent_off')
  
    products.map { |product|
      product.discounted_price_cents = product.price_cents * (100 - percent_off) / 100
      product
    }
  end

end