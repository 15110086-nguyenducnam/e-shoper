class CategoriesController < ApplicationController

  def show
    @product = Product.new
    @order_item = current_order.order_items.new
    @categories_item = Category.all
    @producs_user = Product.where(category_id: params[:id])
  end

end
