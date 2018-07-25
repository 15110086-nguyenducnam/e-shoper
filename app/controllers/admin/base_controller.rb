class Admin::BaseController < ApplicationController
  # Trigger
  before_action :authenticate_user!
  before_action :check_admin_permission

  layout 'admin'
  
  def check_admin_permission
    unless current_user.admin?
      redirect_to root_path
    end
  end

end