class HomeController < ApplicationController

  def index
    @product = Product.new
    @producs_user = Product.all
    @categories_item = Category.all
    @order_item = current_order.order_items.new
  end

end
