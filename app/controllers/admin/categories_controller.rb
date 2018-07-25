class Admin::CategoriesController < Admin::BaseController

  def index
    @category=Category.new
    @get_category=Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    @get_category = Category.all
    @success = @category.destroyed?
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
