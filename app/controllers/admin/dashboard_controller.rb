class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permission

  layout 'admin'
  def index
    @product = Product.new
    @category_dashboard=Category.all
    @get_Product=Product.all
  end

  private
    def check_admin_permission
      if current_user.admin?
        # redirect_to dashboard_admin_path
      else
        redirect_to root_path
      end
    end

  protected
    def after_sign_out_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || new_user_session_path
    end

end
