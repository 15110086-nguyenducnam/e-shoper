class CartsController < ApplicationController
  layout 'application'

  def show
    @order_items = current_order.order_items
    @total_price = current_order.subtotal
    @product = Product.new
  end

end
