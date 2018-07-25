class Admin::ProductsController < Admin::BaseController

  def index
    @product = Product.new
    @categories_item = Category.all
  end

  def show
    @categories_item = Category.all
    @category_dashboard = Category.all
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @category_dashboard = Category.all
  end

  def create
    @product = Product.new(product_params)
    @success = @product.save
    redirect_to admin_dashboard_path
  end

  def update
    @product = Product.find(params[:id])
    @success = @product.update_attributes(product_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_dashboard_path
  end

  private def product_params
    params.require(:product).permit( :name, :description,:price, :category_id, :image)
  end
end
