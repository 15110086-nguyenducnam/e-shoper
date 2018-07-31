class OrderItemsController < ApplicationController

  def create
    @order = current_order
    if @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
        number = @order_item.quantity.to_f + 1
        @order_item.update_attribute :quantity, number
      else
        @order_item = @order.order_items.new(order_item_params)
        @success = @order.save
    end
    session[:order_id] = @order.id
    redirect_to carts_show_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    if params[:add].present? && params[:add] == "true"
      # add product into cart
      quantity = @order_item.quantity.to_f + 1
      @success = @order_item.update_attribute :quantity, quantity
    elsif params[:sub].present? && params[:sub] == "true"
      # sub product into cart
        quantity = @order_item.quantity.to_f - 1
        if quantity == 0
          @order_item.destroy
          @success = @order_item.destroyed?
        else
          @success = @order_item.update_attribute :quantity, quantity
      end
    end
    @order_items = @order.order_items
    redirect_to carts_show_path
  end

  def destroy
    @order = current_order
    @order_item=@order.order_items.find(params[:id])
    @order_item.destroy
    @success = @order_item.destroyed?
    @order_items = @order.order_items
    redirect_to carts_show_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
