class ProductsController < ApplicationController

  def index
    @categories_item = Category.all
    @order_item = current_order.order_items.new
    @producs_user = Product.all
    @product = Product.new
    if params[:product][:name]
        @order_item = current_order.order_items.new
        @producs_user = Product.search_by_full_name(params[:product][:name])
        if @producs_user.size <= 0
            @producs_user = Product.all
        end
     else
      @producs_user = Product.all
    end
  end

  def show
    @categories_item = Category.all
    @product = Product.new
  end

  def productdetail
    @categories_item = Category.all
    @order_item = current_order.order_items.new
    @product_detail = Product.find(params[:product_id])
  end

  private def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :image)
  end
end
