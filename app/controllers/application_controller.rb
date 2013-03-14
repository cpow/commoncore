class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def only_admin_user
    redirect_to root_path unless (current_user and current_user.has_role?(:admin))
  end
end
