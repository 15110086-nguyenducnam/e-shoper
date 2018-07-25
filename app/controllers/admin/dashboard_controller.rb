class Admin::DashboardController < Admin::BaseController

  def index
    @product = Product.new
    @category_dashboard=Category.all
    @get_Product=Product.all
  end

  protected
    def after_sign_out_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || new_user_session_path
    end

end
