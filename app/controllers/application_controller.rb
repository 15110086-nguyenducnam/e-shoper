class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_cache_headers
    protect_from_forgery with: :exception
    helper_method :current_order

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_order
    if !session[:order_id].nil?
      return Order.find(session[:order_id])
    else
      return Order.new
    end
  end
  # redirect after login sucessful
   protected
    def after_sign_in_path_for(resource)
      if current_user.admin?
         request.env['omniauth.origin'] || stored_location_for(resource) || admin_dashboard_path
  # do something
      else
          request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      end
    end
    #  redirect after logout
    protected
    def after_sign_out_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || new_user_session_path
    end

   private
  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
